class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:about, :contact]
  #layout :resolve_layout

  def home
    if(!logged_in?)
      redirect_to login_path
    end
  end



  def about
  end

  def contact
  end

  private
  #def resolve_layout
  #  case action_name
  #  when "login", "create", "signup", "loggedin"
  #    "welcome_layout"
  #  else
  #    "application"
  #  end
  #end
end
