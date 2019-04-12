# frozen_string_literal:true

class MovieCLI
  def call
    puts "Welcome to IMDb's Top 50 Movies!".colorize(:light_blue)
    puts "Please make a selection (Choose from 1 - 50):".colorize(:light_blue)
    sleep(3)

    list

    input = gets.strip.to_i

    if input > 0 && input < 51
      true
    else
      puts "Invalid entry, please choose from 1 - 50".colorize(:red)
      sleep(2)
      call
    end

    movie = lookup_movie_by_rank(input)

    first_selection(movie)
    second_selection(movie)

    command = end_commands(movie)
  end

  def list
    Scraper.new.scrape_movies
    Movie.all.each do |movie|
      puts "#{movie.rank}." + " " + "#{movie.name}".colorize(:green)
      puts "--------------------------------------".colorize(:gray)
    end
  end

  def first_selection(movie)
    puts "You've selected #{movie.name}. Here's some quick info:".colorize(:light_blue)
    puts "Year Released: #{movie.year}".colorize(:green)
    puts "Genre: #{movie.genre}".colorize(:green)
    puts "Movie Duration: #{movie.duration}".colorize(:green)
    puts "IMDb Rating: #{movie.rating}".colorize(:green)
    puts "--------------------------------------".colorize(:gray)
    puts more_info + "#{movie.name}?".colorize(:red)
  end

  def second_selection(movie)
    input = gets.strip.downcase
    if input == "yes"
      Scraper.new.scrape_movie(movie)
      puts "Here's more info about #{movie.name}:".colorize(:light_blue)
      puts "Bio: #{movie.bio}".colorize(:green)
      puts "Director: #{movie.director}".colorize(:green)
      puts "Cast: #{movie.cast}".colorize(:green)
      puts "#{movie.income}".colorize(:green)
      puts "Votes: #{movie.votes}".colorize(:green)
      puts "--------------------------------------".colorize(:gray)
      puts back.colorize(:cyan)
      puts (visit + "#{movie.name}.").colorize(:cyan)
      puts exit_message.colorize(:cyan)
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

  def end_commands(movie)
    input2 = gets.strip.downcase
    if input2 == "back"
        call
    elsif input2 == "open"
        open_url(movie)
        call
    elsif input2 == "exit"
        exit_cli
    else
      puts "Invalid entry, returning to movie list."
      call
    end
  end

  def back
    "Type 'back' to return to the Movie List."
  end

  def visit
    "Type 'open' to visit the IMDb webpage for "
  end

  def open_url(movie)
    Launchy.open("#{movie.url}")
  end

  def exit_message
    "Type 'exit' to exit out of the Movie List."
  end

  def exit_cli
    "Goodbye!"
  end
end


def asdf(arg)
  if arg
    do_something
  else
    asdf(new_arg)
  end
end
