# frozen_string_literal:true

class MovieList
  attr_reader :rank, :name, :year, :genre, :duration, :rating, :bio, :director, :cast,
              :gross_income, :votes, :url
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
end

# Movie.new(rank: rank, name: name, year: year, genre: genre, duration: duration, rating: rating, url: url)
