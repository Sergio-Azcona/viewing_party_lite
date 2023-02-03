class TopMovie
  attr_reader :title, :vote_average, :id
  def initialize(top_movie_data)
    @title = top_movie_data[:title]
    @vote_average = top_movie_data[:vote_average]
    @id = top_movie_data[:id]
  end

end