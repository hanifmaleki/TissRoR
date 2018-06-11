module SessionsHelper

  # Logs in the given users.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in users (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Logs out the current users.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Returns true if the users is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
end
