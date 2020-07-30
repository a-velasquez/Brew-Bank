class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create 
    @user = User.create(user_params)
    if @user.save 
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      flash[:message] = "User Was Not Created!"
      render :new 
    end
  end

  def show
    @user = User.find_by(id: params[:id]) 
  end


end