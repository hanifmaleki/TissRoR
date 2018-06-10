class StaticPagesController < ApplicationController
  layout :resolve_layout

  def home
    if($current_user.nil?)
      redirect_to action: 'login'
    end
    puts $current_user
    @user = $current_user
  end

  def login
    @user = User.new
    #render :layout => 'welcome_layout'
  end

  def about
  end

  def contact
  end

  def loggedin
    @user = User.new(user_params)
    user = User.find_by(username: @user[:username])
    if(user && user.authenticate(user_params[:password]))
      $current_user = user
      redirect_to action: 'home'
    else
      puts "Passing user is #{@user}"
      flash.now[:danger] = 'Invalid email/password combination'
      render 'login'
    end
  end

  def signup
    @user = User.new
  end

  # POST /projects
  # POST /projects.json
  def create
    @user = User.new(user_params)

    if @user.save
        redirect_to action: 'login'
    else
      render 'signup'
    end
  end

  def logout
    $current_user = nil
    puts "Set to nil #{$current_user}"
    redirect_to action: "login"
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password,  :username, :password_confirmation)
  end

  private
  def resolve_layout
    case action_name
    when "login", "create", "signup", "loggedin"
      "welcome_layout"
    else
      "application"
    end
  end
end
