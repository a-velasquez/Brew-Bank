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
      flash[:error] = "Sorry, login info was incorrect. Please try again."
      redirect_to login_path
    end
  end

  def omniauth  #currently creates from google and facebook, need to implement twitter if possible 
    user = User.create_from_omniauth(auth)
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = user.errors.full_messages.join(", ")
      redirect_to login_path
    end
    binding.pry

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
