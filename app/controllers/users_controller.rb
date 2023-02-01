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
    else
      flash.notice = "Update NOT Successful"
      render :new
    end
  end


  private

  def user_params
    params.permit(:name, :email)
  end
end