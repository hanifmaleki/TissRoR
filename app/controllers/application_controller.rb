class ApplicationController < ActionController::Base
  $current_user

  def current_user
    @current_user = $current_user
  end
end
