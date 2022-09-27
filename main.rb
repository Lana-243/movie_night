require_relative 'lib/film'
require_relative 'lib/film_collection'
require_relative 'lib/parser'

NUMBER_OF_MOVIES = 7

puts "Привет!"
puts "Давай выберем интересный фильм"

collection = FilmCollection.new(Parser.from_imdb.shuffle.first(NUMBER_OF_MOVIES))

collection.directors.each.with_index(1) do |director, index|
  puts "#{index}: #{director}"
end

director_choice = 0
until director_choice.between?(1, collection.directors_number)
  puts "Выбери режиссера, чей фильм ты бы хотел посмотреть:"
  director_choice = STDIN.gets.to_i
end

chosen_movie = collection.movie_choice(collection.directors[director_choice - 1])

puts "Сегодня советую посмотреть фильм: #{chosen_movie}"
