class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorized?, :redirect_if_not_logged_in, :redirect_if_logged_in 

  private 

  def logged_in? 
    !!session[:user_id]
  end

  def current_user 
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def authorized?(review)
    review.user == current_user
  end

  def redirect_if_logged_in 
    if logged_in? 
      redirect_to user_path(current_user)
    else
      render :welcome
    end
  end

  def redirect_if_not_logged_in 
    redirect_to root_path if !logged_in?
  end

end
