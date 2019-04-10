# frozen_string_literal:true

# handles talking to the user. So "puts" and "gets"
class MovieCLI
  attr_accessor :input
  def call
    puts "Welcome to IMDb's Top 50 Movies!"
    puts "Please make a selection (Choose from 1 - 50):"

    list

    @input = gets.strip.downcase
    lookup_movie_by_rank(input)

    first_selection

    second_selection
  end

  def list
    Scraper.new.scrape_movies
    Movie.all.each do |movie|
      puts "#{movie.rank}. #{movie.name}"
    end
  end

  def first_selection
    Movie.all.each do |movie|
      if @input == movie.rank
        puts "You've selected #{movie.name}. Here's some quick info:"
        puts "Year Released: #{movie.year}"
        puts "Genre: #{movie.genre}"
        puts "Movie Duration: #{movie.duration}"
        puts "IMDb Rating: #{movie.rating}"
        puts more_info + "#{movie.name}?"
      end
    end
  end

  def second_selection
    input = gets.strip.downcase
    if input == @input && input == "yes"
      MovieInfo.all.each do |movie|
        puts "Here's more info about #{movie.name}"
        puts "Bio: #{movie.bio}"
        puts "Director: #{movie.director}"
        puts "Cast: #{movie.cast}"
        puts "Gross Income: #{gross_income}"
        puts "Votes: #{movie.votes}"
      end
    end
  end

  def lookup_movie_by_rank(input)
    Movie.find_by_rank(input)
  end

  def more_info
    "Would you like to find out more about "
  end

  def exit_cli
    puts "Goodbye!"
  end
end
