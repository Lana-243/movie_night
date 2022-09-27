class FilmCollection
  attr_reader :films

  def initialize(films)
    @films = films
  end

  def directors
    @films.map { |film| film.director }.uniq
  end

  def directors_number
    directors.length
  end

  def movie_choice(chosen_director)
    @films.select { |film| film.director == chosen_director }.sample
  end
end
