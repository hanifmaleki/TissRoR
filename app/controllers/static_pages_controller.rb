class StaticPagesController < ApplicationController
  before_action :logged_in_user
  #layout :resolve_layout

  def home
    #if($current_user.nil?)
    #  redirect_to action: 'login'
    #end
    #puts $current_user
    #@users = $current_user
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
