# frozen_string_literal:true

class Movie
  attr_reader :rank, :name, :year, :genre, :duration, :rating, :bio, :director,
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
end

# Movie.new(rank: rank, name: name, year: year, genre: genre, duration: duration, rating: rating, url: url)
