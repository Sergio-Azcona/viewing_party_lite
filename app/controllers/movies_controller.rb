class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])  
    @top_rated_movies = MovieFacade.top_rated
  end

  def search
  end

  def show
    @user = User.find(params[:user_id])  
  end
end