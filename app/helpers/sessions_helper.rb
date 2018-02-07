module SessionsHelper
  def logged_in?
    !!current_user
  end
    
  def current_user # User Instance || nil
  	@current_user ||= User.find_by(id: session[:user_id])
  end
end
