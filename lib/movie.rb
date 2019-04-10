# frozen_string_literal:true

# only cares about Movies. Never puts, never scrapes.
class Movie
  attr_reader :rank, :name, :year, :genre, :duration, :rating, :url,
              :bio, :director, :cast, :gross_income, :votes
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
    all.find do |x|
      x.rank == rank
    end
  end
end

# Movie.new(rank: rank, name: name, year: year, genre: genre
# , duration: duration, rating: rating, url: url)
