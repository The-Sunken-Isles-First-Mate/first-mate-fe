class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to root_path, notice: 'You need to sign in' unless current_user
  end
end