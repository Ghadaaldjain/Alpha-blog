class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id 
			flash[:notice] = "Logged in successfully"
  	  		redirect_to user
		else
			flash[:notice] = "Email or password is incorrect" 
			#flash.now: (now) because we are not redirecting to another view, we are in the same page
			redirect_to login_path
		end

	end


	def destroy
		session[:user_id] =  nil
		flash[:notice] = "Logged out, bye"
		redirect_to articles_path


	end
end
