# Top 50 Movies CLI App

## Objectives

1. Use Nokogiri to scrape the IMDb Top 250 list to return the top 50 movies all time.
2. Use scraped data to create a CLI where the user can return a list of the top 50 movies.
3. Give user option to select one of the movies and find more information about it.
4. User can input `open` to open the web page for each individual movie for even more information.

## Overview

This project will scrape the IMDb web page and lists the top 50 movies. When the CLI starts, it will welcome the user and give them a list of the top 50 movies. Once the user enters a number from 1 to 50, it will return the corresponding movie and give the user more information about it, which will include its name, cast, genre, etc. If a user would like even more information, they can visit the web page of the movie itself and view it to their liking. The user can also return to the original list to select a different movie. Once a user is done, they can `exit` the CLI and it will output a goodbye message.

The original web page looks like this:

![IMDB web page](/Users/ezzabousaif/Desktop/Screen Shot 2019-04-05 at 12.38.25 PM.png)
