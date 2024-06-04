class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= 
    User.new({
      id: session[:user]["id"],
      uid: session[:user]["uid"],
      username: session[:user]["username"]
    }) if session[:user]
  end
end