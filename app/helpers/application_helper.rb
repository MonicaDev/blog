module ApplicationHelper

	def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end
end
