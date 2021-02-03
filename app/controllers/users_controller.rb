class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    #refactor the downcase at the model level
    user[:email] = user[:email].downcase

    new_user = User.create(user)
    flash[:success] = "Welcome, #{new_user.email}!"
    session[:user_id] = new_user.id
    redirect_to root_path
  end

  def show
    @user = User.find(session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end