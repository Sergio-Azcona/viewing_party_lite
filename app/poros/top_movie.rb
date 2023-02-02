class TopMovie
  attr_reader :title, :vote_average
  def initialize(top_movie_data)
    @title = top_movie_data[:title]
    @vote_average = top_movie_data[:vote_average]
  end

end