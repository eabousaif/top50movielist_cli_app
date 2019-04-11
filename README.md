# Top 50 Movies CLI App

## Objectives

1. Use Nokogiri to scrape the IMDb Top 50 list.
2. Use scraped data to create a CLI where the user can return a list of the top 50 movies.
3. Give user option to select one of the movies and find more information about it.
4. User can input `open` to open the web page for each individual movie for even more information.

## Overview

This project will scrape the IMDb web page and list the top 50 movies. When the CLI starts, it will welcome the user and give them a list of the top 50 movies. Once the user enters a number from 1 to 50, it will return the corresponding movie and give the user more information about it, which will include its name, year of release, genre, etc. If a user would like even more information, they can visit the web page of the movie itself and view it to their liking. The user can also return to the original list to select a different movie. Once a user is done, they can `exit` the CLI and it will output a goodbye message.

## Navigation

1. Type in `ruby bin/movielist.rb` to initiate the CLI.
2. Once the terminal outputs the list of movies, make a selection from **1 to 50** to print out basic information about the movie you selected.
3. You will be prompted to type in `yes` or `no` in the terminal to get more information about the movie. If you type in no, you will be redirected to the original list, but if you type in yes, the terminal will output even more information about the selected movie.
4. After the terminal outputs the information, you will be prompted to type in 3 different selections:
  a. `back` will return you to the original list.
  b. `open` will open the selected movie's URL in your default browser.
  c. `exit` will exit out of the CLI and puts a goodbye message.

