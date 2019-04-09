# frozen_string_literal:true

# handles talking to the user. So "puts" and "gets"
class MovieCLI
  def call
    puts "Welcome to IMDb's Top 50 Movies!"
    puts "Please make a selection (Choose from 1 - 50):"

    Scraper.new.scrape_movies
    puts Movie.all.first.name
    binding.pry
    # iterate and puts the movies so the user knows what they are selecting

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
