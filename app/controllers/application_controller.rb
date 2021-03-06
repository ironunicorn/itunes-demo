class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
  	User.find_by_session_token(session[:session_token])
  end

  def log_in_user!(user)
  	user.reset_session_token!
  	session[:session_token] = user.session_token
  end

  def logged_in?
  	!!current_user
  end

  def user_params
		params.require(:user).permit(:email, :password)
	end

  def redirect_to_login
    redirect_to new_session_url unless logged_in?
  end
end
