class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update]
  def show
  	
  	@articles = @user.articles
  end 

  def index
  	@users = User.all	
  end

  def new
	@user = User.new
  end
  

  def create
    @user = User.new(user_params)

    if @user.save
    	session[:user_id] = @user.id 
  	  flash[:notice] = "Welcome to article land, you have successfully registered"
  	  redirect_to @user

      
    else
     render 'new'
    end
  end

  def edit
  
  end

  def update
  	if @user.update(user_params)
  		flash[:notice] = "Updated successfully"
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end

  private
  def user_params
	params.require(:user).permit(:username, :email, :password)
  end
  def set_user
  	@user = User.find(params[:id])
  end 
  def require_same_user
  	if current_user != @user 
  	  flash[:notice] = "You can only edit your account"
  	  redirect_to @user
  	end
  end 

end