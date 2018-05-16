module PersonHelper
  def current_user
    @current_user = $current_user
  end
end
