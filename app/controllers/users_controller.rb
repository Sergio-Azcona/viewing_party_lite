class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    if @user.save
      flash.notice = "Update Successful"
      redirect_to user_path(@user)
    else
      flash.notice = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def discover
    # require 'pry';binding.pry
    @top_rated_movies = MovieFacade.top_rated    
  end

  def movies
    @top_rated_movies = MovieFacade.top_rated

  end

  private
  def user_params
    params.permit(:name, :email)
  end
end