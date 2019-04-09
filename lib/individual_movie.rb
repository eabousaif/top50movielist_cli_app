class IndividualMovie
  attr_reader :bio, :director, :cast, :gross_income, :votes
  @@all = []

  def initialize(bio:, director:, cast:, gross_income:, votes:)
    @bio = bio
    @director = bio
    @cast = cast
    @gross_income = gross_income
    @votes = votes
    @@all << self
  end

  def self.all
    @@all
  end
end
