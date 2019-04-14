# frozen_string_literal:true

class MovieCLI
  def call
    welcome
    list
    prompt_to_input

    input = gets.strip.to_i
    input_condtion(input)

    movie = lookup_movie_by_rank(input)

    display_movie_info(movie)
    display_additional_movie_info(movie)

    end_commands(movie)
  end

  def welcome
    puts "Welcome to IMDb's Top 50 Movies!".colorize(:light_blue)
    sleep(1)
  end

  def prompt_to_input
    puts "Please make a selection (Choose from 1 - 50):".colorize(:light_blue)
  end

  def list
    Scraper.new.scrape_movies
    Movie.all.each do |movie|
      puts movie.rank.to_s + "." + " " + movie.name.to_s.colorize(:green)
      puts "--------------------------------------".colorize(:gray)
    end
  end

  def display_movie_info(movie)
    puts "You've selected #{movie.name}. Here's some quick info:".colorize(:light_blue)
    puts "Year Released: #{movie.year}".colorize(:green)
    puts "Genre: #{movie.genre}".colorize(:green)
    puts "Movie Duration: #{movie.duration}".colorize(:green)
    puts "IMDb Rating: #{movie.rating}".colorize(:green)
    puts "--------------------------------------".colorize(:gray)
    puts more_info + "#{movie.name}?".colorize(:red)
  end

  def display_additional_movie_info(movie)
    input = gets.strip.downcase
    if input == "yes"
      Scraper.new.scrape_movie(movie)
      puts "Here's more info about #{movie.name}:".colorize(:light_blue)
      puts "Bio: #{movie.bio}".colorize(:green)
      puts "Director: #{movie.director}".colorize(:green)
      puts "Cast: #{movie.cast}".colorize(:green)
      puts movie.income.to_s.colorize(:green)
      puts "Votes: #{movie.votes}".colorize(:green)
      puts "--------------------------------------".colorize(:gray)
      options(movie)
    else
      redirect
    end
  end

  def lookup_movie_by_rank(input)
    Movie.find_by_rank(input)
  end

  def input_condtion(input)
    if input >= 1 && input <= 50
      true
    else
      puts "Invalid entry, please choose from 1 - 50".colorize(:red)
      sleep(2)
      call
    end
  end

  def more_info
    "Would you like to find out more about "
  end

  def options(movie)
    puts back.colorize(:cyan)
    puts "#{visit}#{movie.name}.".colorize(:cyan)
    puts exit_message.colorize(:cyan)
  end

  def redirect
    puts "Redirecting back to movie list...".colorize(:red)
    sleep(1)
    call
  end

  def end_commands(movie)
    input2 = gets.strip.downcase
    if input2 == "back"
      redirect
      call
    elsif input2 == "open"
      open_url(movie)
    elsif input2 == "exit"
      exit_cli
    else
      puts "Invalid entry, redirecting back to movie list."
      call
    end
  end

  def back
    "Type 'back' to return to the movie list."
  end

  def visit
    "Type 'open' to visit the IMDb webpage for "
  end

  def exit_message
    "Type 'exit' to exit out of the movie list."
  end

  def open_url(movie)
    Launchy.open(movie.url.to_s)
  end

  def exit_cli
    puts "Goodbye!".colorize(:light_blue)
    sleep(1)
  end
end
