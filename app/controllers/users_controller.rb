class UsersController < ApplicationController
  layout 'welcome_layout'

  def signup
    @user = User.new
  end

  # POST /projects
  # POST /projects.json
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path
    else
      render 'signup'
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :username, :password_confirmation)
  end


end
