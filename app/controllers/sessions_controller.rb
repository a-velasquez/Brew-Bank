class SessionsController < ApplicationController
  
  def new
    if logged_in?
      redirect_to user_path(current_user)
    else  
      @user = User.new
    end  
  end

  def create 
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Log In Info Is Incorrect. Please Try Again."
      redirect_to root_path
    end
  end

  def omniauth
    user = User.create_from_omniauth(auth)
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to login_path
    end
  end
  
  def destroy 
    session.delete(:user_id) 
    redirect_to root_path
  end

  private 

    def auth 
      request.env['omniauth.auth']
    end
  
end
