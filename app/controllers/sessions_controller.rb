class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.find_by_credentials(
									user_params[:email], 
									user_params[:password])
		if @user.save
			log_in_user!(@user)
			redirect_to user_url(@user)
		else
			flash.now[:errors] = ["invalid email or password"]
			render 'new'
		end
	end

	def destroy
		user = current_user
		user.reset_session_token!
		session[:session_token] = nil
		redirect_to new_session_url
	end

	def user_params
		params.require(:user).permit(:email, :password)
	end
end
