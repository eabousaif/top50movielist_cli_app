# frozen_string_literal:true

require "open-uri"

class Scraper
  attr_accessor :doc

  def initialize
    html = File.read("https://www.imdb.com/search/title?genres=drama" \
           "&groups=top_250&sort=user_rating,desc")
    @doc = Nokogiri::HTML(html)
  end

  def self.scrape_movie_list
    @doc.css("lister-item-content").each do |info|
      rank = info.css("lister-item-index unbold text-primary").value
      binding.pry
      movie_name = info.css("")
      year = info.css("")
      genre = info.css("")
      duration = info.css("")
      rating = info.css("")
      bio = info.css("")
      cast = info.css("")
      director = info.css("")
      gross_income = info.css("")
      votes = info.css("")
      url = info.css("")
      movie = Movie.new(rank: rank, name: name, )
    end
  end
end
