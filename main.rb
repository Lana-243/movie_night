require_relative 'lib/film'
require_relative 'lib/film_collection'
require_relative 'lib/parser'

NUMBER_OF_MOVIES = 20

puts "Hello there!"
puts "Lets check how well you know movie directors"
puts "It's movie night!"
puts "Choose the director whose movie you would like to watch:"

collection = FilmCollection.new(Parser.from_imdb.shuffle.first(NUMBER_OF_MOVIES))

collection.directors.each.with_index(1) do |director, index|
  puts "#{index}: #{director}"
end

director_choice = 0
until director_choice.between?(1, collection.directors_number)
  puts "Movie of which director would you like to watch?"
  director_choice = STDIN.gets.to_i
end

chosen_movie = collection.movie_choice(collection.directors[director_choice - 1])

puts "And today I recommend this movie: #{chosen_movie}"
