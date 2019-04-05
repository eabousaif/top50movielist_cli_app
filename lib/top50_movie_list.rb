# frozen_string_literal:true

class MovieList
  attr_reader :rank, :name, :year, :genre, :duration, :rating, :bio, :director,
              :gross_income, :votes
  @@all = []

  def initialize
    @@all << self
  end
end
