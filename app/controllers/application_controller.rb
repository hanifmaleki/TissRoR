class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  #$current_user

  #def current_user
  #  @current_user = $current_user
  #end


  private

  # Confirms a logged-in users.
  def logged_in_user
    unless logged_in?
      #store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end


end
