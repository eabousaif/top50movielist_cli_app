# frozen_string_literal:true

# handles scraping. Never puts. Not communicating to the user.
class Scraper
  attr_accessor :doc, :movie

  def initialize
    @doc = Nokogiri::HTML(open("https://www.imdb.com/search/title?genres=drama" \
           "&groups=top_250&sort=user_rating,desc"))
  end

  def scrape_movies
    doc.css(".lister-item-content").each do |movie_info|
      @movie = Movie.new(
        rank: movie_info.css(".lister-item-index").text.chop.to_i,
        name: movie_info.css(".lister-item-header a").text,
        year: movie_info.css(".lister-item-year").text[1..4],
        genre: movie_info.css(".genre").text[1..-1].strip,
        duration: movie_info.css(".runtime").text,
        rating: movie_info.css(".ratings-bar .ratings-imdb-rating strong").text + "/10",
        url: "https://www.imdb.com" + movie_info.css(".lister-item-header a").first.attr("href")
      )
    end
  end

  def scrape_movie(movie)
    ind_movie = Nokogiri::HTML(open(movie.url))
    ind_movie.css(".pagecontent").each do |movie_info|
      movie.bio = movie_info.css(".summary_text").text.strip
      movie.director = movie_info.css(".credit_summary_item a").first.text
      movie.cast = movie_cast(movie_info)
      movie.income = movie_income(movie_info)
      movie.votes = movie_votes(movie_info)
    end
  end

  def movie_cast(movie_info)
    stars_of_movie = movie_info.css(".credit_summary_item a").to_a.select do |element|
      element.values.first.include?("/name")
    end
    stars_of_movie[3..5].map do |actor|
      actor.text.strip
    end
  end

  def movie_income(movie_info)
    unsantized_income = movie_info.css(".txt-block").to_a.select do |element|
      element.text.include?("Gross USA:")
    end
    unsantized_income.map { |gross| gross.text.strip }.first
  end

  def movie_votes(movie_info)
    movie_info.css(".small").to_a.select do |element|
      element.values.include?("ratingCount") # rubocop:disable Performance/InefficientHashSearch
    end.map(&:text).first
  end
end
