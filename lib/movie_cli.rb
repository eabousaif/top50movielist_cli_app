# frozen_string_literal:true

class MovieCLI
  def initialize
    puts "Welcome to IMDb's Top 50 Movies!"
  end

  def call
    input = ""
    puts "Please make a selection (Choose from 1 - 50):"
    input = gets.strip
  end
end
