class ApplicationController < ActionController::Base
	helper_method :current_user,  :logged_in?

	def current_user
		@crurrent_user ||= User.find(session[:user_id]) if session[:user_id] 
		# ||= means if already refrenced (from database) then just return its
	end

	def logged_in?
		!!current_user
	end


	def require_user

		if !logged_in?
			flash[:notice]=  "You must login first!"
			redirect_to login_path
		end
	end

	def require_same_user
		if current_user != @article.user
			flash[:notice]=  "Action not allowd for you"
		end
	end


end
