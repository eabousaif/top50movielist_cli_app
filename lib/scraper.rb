# frozen_string_literal:true

require "nokogiri"
require "open-uri"
require "pry"

class Scraper
  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(open("https://www.imdb.com/search/title?genres=drama" \
           "&groups=top_250&sort=user_rating,desc"))
  end

  def scrape_movies
    movies = []
    doc.css(".lister-item-content").each do |movie_info|
      rank = movie_info.css(".lister-item-index").text.chop
      name = movie_info.css(".lister-item-header a").text
      year = movie_info.css(".lister-item-year").text[1..4]
      genre = movie_info.css(".genre").text[1..-1].strip
      duration = movie_info.css(".runtime").text
      rating = movie_info.css(".ratings-bar .ratings-imdb-rating strong").text + "/10"
      url = "https://www.imdb.com" + movie_info.css(".lister-item-header a").first.attr("href")
      scrape_movie(url)
      movie = Movie.new(rank: rank, name: name, year: year, genre: genre, duration: duration, rating: rating, url: url)
      movies << movie
    end
    movies
    binding.pry
  end

  def scrape_movie(url)
    ind_movie = Nokogiri::HTML(open(url))
    ind_movie.css(".pagecontent").each do |movie_info|
      bio = movie_info.css(".summary_text").text.strip
      director = movie_info.css(".credit_summary_item a").first.text
      cast = movie_info.css(".credit_summary_item a").to_a.select{|element| element.values.first.include?("ref_=tt_ov_st_sm")}[0..2].map{|actor| actor.text}
      gross_income = movie_info.css(".txt-block").to_a.select{|element| element.text.include?("Gross USA:")}.map{|gross| gross.text.strip}
      votes = movie_info.css(".small").to_a.select{|element| element.values.include?("ratingCount")}.map{|votes| votes.text}
      movie = MovieInfo.new(bio: bio, director: director, cast: cast, gross_income: gross_income, votes: votes)
    end
  end
end
