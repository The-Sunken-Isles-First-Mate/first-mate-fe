class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_campaign_id

  def current_user
    @current_user ||=
    User.new({
      id: session[:user]["id"],
      uid: session[:user]["uid"],
      username: session[:user]["username"]
    }) if session[:user]
  end

  def current_campaign_id
    @current_campaign_id ||=
    session[:campaign_id] if session[:campaign_id]
  end
end
