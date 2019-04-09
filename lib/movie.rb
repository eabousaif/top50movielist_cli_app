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
    @@all.detect {|movie| movie.rank == rank}
  end

  def self.find_by_name(name)
    @@all.detect {|movie| movie.name == name}
  end
end

# Movie.new(rank: rank, name: name, year: year, genre: genre, duration: duration, rating: rating, url: url)
