# frozen_string_literal:true

require "Nokogiri"
require "open-uri"
require "pry"

class Scraper
  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(open("https://www.imdb.com/search/title?genres=drama&groups=top_250&sort=user_rating,desc"))
  end

  def self.scrape_movie_list(url)
    movie_list_hash = []
    @doc.css(".lister-item-content").each do |movie|
      binding.pry
      # rank = info.css("")
      # movie_name = info.css("")
      # year = info.css("")
      # genre = info.css("")
      # duration = info.css("")
      # rating = info.css("")
      # bio = info.css("")
      # cast = info.css("")
      # director = info.css("")
      # gross_income = info.css("")
      # votes = info.css("")

      #   movie_list_hash << {:rank => rank, :name => movie_name, :year => year, :duration => duration, :rating => rating, :bio => bio, :cast => cast, :director => director, :gross_income => gross_income, :votes => votes}
    end
    movie_list_hash
  end
end
