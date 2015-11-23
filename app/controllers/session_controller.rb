class SessionController < ApplicationController
  def new
  end

  def create
  	user = User.find_by :email => params[:email]
  	if user.present? && user.authenticate(params[:password])
  		session[:user_id] = user[:id]
      	flash[:message] = "Welcome back, #{ user.username }"
  		redirect_to user
  	else
      redirect_to login_path
      flash[:message] = "Invalid email or password. Please try again."
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
end
