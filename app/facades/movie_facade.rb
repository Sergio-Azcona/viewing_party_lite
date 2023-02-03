class MovieFacade
  def self.top_rated
    data = MovieService.top_rated_by_vote_average
    results = data[:results]
    results.map do |top_movie_data|
      TopMovie.new(top_movie_data)
    end
  end

  def self.movie_data(id)
    movie_data = MovieService.get_movie(id)
    Movie.new(movie_data)
  end
end