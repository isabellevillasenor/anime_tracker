class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.email}!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = 'Your credentials are stinky, and that stinks.'
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = "Logged Out!"
    redirect_to root_path
  end
end