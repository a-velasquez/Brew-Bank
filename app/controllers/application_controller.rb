class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  

  private 

  def logged_in? 
    !!session[:user_id]
  end

  def current_user 
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def find_user_by_id
    params[:user_id] ? @user = User.find(params[:user_id]) : @user = User.find(params[:id])
  end

  def redirect_if_not_logged_in
    flash[:error] = "You Must Be Logged In!" 
    redirect_to root_path if !logged_in?
  end

  def authorized?
    if find_user_by_id != current_user
      redirect_to user_path(current_user)
    end
  end
end
