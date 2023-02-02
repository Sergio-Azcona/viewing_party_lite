class MoviesController < ApplicationController
  def index
    @top_rated_movies = MovieFacade.top_rated
  end
end