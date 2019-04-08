# frozen_string_literal:true

require "open-uri"
require "pry"

class Scraper
  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(open("https://www.imdb.com/search/title?genres=drama" \
           "&groups=top_250&sort=user_rating,desc"))
  end

  def scrape_movie_list
    doc.css(".lister-item-content").each do |movie_info|
      rank = movie_info.css(".lister-item-index").text.chop
      name = movie_info.css(".lister-item-header a").text
      year = movie_info.css(".lister-item-year").text[1..4]
      genre = movie_info.css(".genre").text[1..-1].strip
      duration = movie_info.css(".runtime").text
      rating = movie_info.css(".ratings-bar .ratings-imdb-rating strong").text
      url = "www.imdb.com" + movie_info.css(".lister-item-header a").first.attr("href")
      scrape_movie(url)
      movie = Movie.new(rank: rank, name: name, year: year, genre: genre, duration: duration, rating: rating, url: url)
      binding.pry
    end
  end

  def scrape_movie(url)

  end
end
