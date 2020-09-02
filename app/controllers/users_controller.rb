class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]
  before_action :authorized?, only: [:show]

  def new
    @user = User.new
  end

  def create 
    @user = User.create(user_params)
    if @user.save 
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      render :new 
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @reviews = @user.reviews
  end

  private 

    def user_params 
      params.require(:user).permit(:username, :email, :password)
    end

end