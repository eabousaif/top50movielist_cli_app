# frozen_string_literal:true

class MovieCLI
  def call
    puts "Welcome to IMDb's Top 50 Movies!"
    puts "Please make a selection (Choose from 1 - 50):"

    Scraper.new.scrape_movies
    input = gets.strip
    lookup_movie_by_rank(input)
  end

  def exit_cli
    puts "Goodbye!"
  end

  def lookup_movie_by_rank(input)
    Movie.find_by_rank(input)
  end
end
