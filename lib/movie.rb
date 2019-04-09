# frozen_string_literal:true

class Movie
  attr_reader :rank, :name, :year, :genre, :duration, :rating, :url
  @@all = []

  def initialize(rank:, name:, year:, genre:, duration:, rating:, url:)
    @rank = rank
    @name = name
    @year = year
    @genre = genre
    @duration = duration
    @rating = rating
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_rank(rank)
    movies = Scraper.new.scrape_movies
    movies.find_by(rank: rank)
  end
end

# Movie.new(rank: rank, name: name, year: year, genre: genre
# , duration: duration, rating: rating, url: url)
