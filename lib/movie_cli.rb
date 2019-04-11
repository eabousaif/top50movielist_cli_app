# frozen_string_literal:true

# handles talking to the user. So "puts" and "gets"
class MovieCLI

  def call
    puts "Welcome to IMDb's Top 50 Movies!".colorize(:light_blue)
    puts "Please make a selection (Choose from 1 - 50):".colorize(:light_blue)

    list

    input = gets.strip.downcase
    movie = lookup_movie_by_rank(input)

    first_selection(movie)

    second_selection(movie)

    loop do

      case second_selection(movie)
      when input == "back"
        list
      when input == "open"
        open_url(movie)
        call
      when input == "exit"
        exit_cli
      end
    end
  end

  def list
    Scraper.new.scrape_movies
    Movie.all.each do |movie|
      puts "#{movie.rank}. #{movie.name}"
    end
  end

  def first_selection(movie)
        puts "You've selected #{movie.name}. Here's some quick info:".colorize(:light_blue)
        puts "Year Released: #{movie.year}".colorize(:green)
        puts "Genre: #{movie.genre}".colorize(:green)
        puts "Movie Duration: #{movie.duration}".colorize(:green)
        puts "IMDb Rating: #{movie.rating}".colorize(:green)
        puts more_info + "#{movie.name}?".colorize(:red)
  end

  def second_selection(movie)
    input = gets.strip.downcase
    if input == "yes"
      Scraper.new.scrape_movie(movie.url)
      puts "Here's more info about #{movie.name}".colorize(:light_blue)
      puts "Bio: #{movie.bio}".colorize(:green)
      puts "Director: #{movie.director}".colorize(:green)
      puts "Cast: #{movie.cast}".colorize(:green)
      puts "Gross Income: #{movie.income}".colorize(:green)
      puts "Votes: #{movie.votes}".colorize(:green)
      puts "Movie URL: #{movie.url}".colorize(:green)
      puts back.colorize(:light_blue)
      puts (visit + "#{movie.name}").colorize(:light_blue)
      else
        call
    end
  end

  def lookup_movie_by_rank(input)
    Movie.find_by_rank(input)
  end

  def more_info
    "Would you like to find out more about "
  end

  def back
    "Type 'back' to return to the Movie List."
  end

  def visit
    "Type 'open' to visit the IMDb webpage for "
  end

  def open_url(movie)
    system("open #{movie.url[input]}")
  end

  def exit_cli
    "Goodbye!"
  end
end
