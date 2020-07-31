class SessionsController < ApplicationController 

  def welcome 
  end

  def new 
    @user = User.new 
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
    session.delete(:user_id) 
    redirect_to root_path
  end

end
