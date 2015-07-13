class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
helper_method :user

 def current_user
    # Note: we want to use "find_by_id" because it's OK to return a nil.
    # If we were to use User.find, it would throw an exception if the user can't be found.
    puts User.find_by_email(session[:user]).to_s
    puts session[:user].to_s
    
    
    @current_user ||= User.find_by_email(session[:user]) if session[:user]
    #@current_user ||= User.find_by_authentication_token(cookies[:auth_token]) if cookies[:auth_token] && @current_user.nil?
    @current_user
  end


def authenticate_user
  if current_user.nil?
    flash[:error] = 'You must be signed in to view that page.'
    redirect_to :root
  end
end
end
