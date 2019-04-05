# frozen_string_literal:true

class MovieList
  attr_reader :rank, :name, :year, :duration, :rating, :bio, :director,
              :votes, :gross_income

  def initialize(name)
    @name = name
  end
end
