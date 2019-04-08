# frozen_string_literal:true

class MovieCLI
  def initialize
    puts "Welcome to IMDb's Top 50 Movies!"
  end

  def call
    scraper_instance = Scraper.new
    scraper_instance.scrape_movie_list
    input = ""
    puts "Please make a selection (Choose from 1 - 50):"
    input = gets.strip
    display_movie
  end

  def display_movie
    Movie.all.each do |movie|
      puts :name
    end
  end
end
