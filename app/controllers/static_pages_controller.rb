class StaticPagesController < ApplicationController
  $current_user
  def home
    @user = $current_user
  end

  def login
    @user = User.new
    render :layout => nil
  end

  def about
  end

  def contact
  end

  def loggedin
    @user = User.find_by(username: user_params[:username])
    if(@user)
      puts "User Already exist"
    else
      puts "Creating User"
      @user = User.new(user_params)
      @user.save
      puts @user
    end
    $current_user = @user
    redirect_to action: 'home'
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :username)
  end
end
