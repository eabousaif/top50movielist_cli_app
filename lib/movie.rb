# frozen_string_literal:true

# only cares about Movies. Never puts, never scrapes.
class Movie
  attr_reader :rank, :name, :year, :genre, :duration, :rating, :url
  attr_accessor :bio, :director, :cast, :income, :votes
  @@all = []

  def initialize(rank: nil, name: nil, year: nil, genre: nil, duration: nil, rating: nil, url:, bio: nil, director: nil, cast: nil, income: nil, votes: nil)
    @rank = rank
    @name = name
    @year = year
    @genre = genre
    @duration = duration
    @rating = rating
    @url = url
    @bio = bio
    @director = director
    @cast = cast
    @income = income
    @votes = votes
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_rank(rank)
    all.find do |movie|
      movie.rank == rank.to_i
    end
  end
end

# Movie.new(rank: rank, name: name, year: year, genre: genre
# , duration: duration, rating: rating, url: url)
