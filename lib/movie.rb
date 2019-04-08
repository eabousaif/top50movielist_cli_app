# frozen_string_literal:true

class Movie
  attr_reader :rank, :name, :year, :genre, :duration, :rating, :bio, :director,
              :gross_income, :votes, :url
  @all = []

  def initialize
    @all << self
  end
end
