class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    #refactor the downcase at the model level
    user[:email] = user[:email].downcase

    new_user = User.create(user_params)
    flash[:success] = "Welcome, #{new_user.email}!"
    redirect_to root_path
  end

  def login_form
  end

  def login
    #this downcase will need to stay here
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      #Tim will refactor this fun stuff
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to root_path
    else
      flash[:error] = 'Your credentials are stinky, and that stinks.'
      render :login_form
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end