class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])  
    # require 'pry';binding.pry
    @top_rated_movies = MovieFacade.top_rated
  end

  def search
  end
end