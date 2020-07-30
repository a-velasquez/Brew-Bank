class SessionsController < ApplicationController 

  def welcome 
  end

  def new 
  end

  def create 
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(password: params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Sorry, your info was incorrect. Please Try Again."
      redirect_to login_path
    end
  end

  def destroy 
    #logout 
  end

end
