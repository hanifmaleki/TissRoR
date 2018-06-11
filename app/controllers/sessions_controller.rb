class SessionsController < ApplicationController
  layout 'welcome_layout'

  def login
    @user = User.new
    #render :layout => 'welcome_layout'
  end

  def loggedin
    #@user = User.find_by(username: params[:session][:usename])
    user = User.find_by(username: params[:session][:username])
    if(user && user.authenticate(params[:session][:password]))
      log_in user
      redirect_to root_url
    else
      puts "Passing users is #{@user}"
      flash.now[:danger] = 'Invalid email/password combination'
      render 'login'
    end
  end

  def logout
    #$current_user = nil
    puts "Set to nil"

    log_out
    #redirect_to root_url
    redirect_to login_url
  end


end
