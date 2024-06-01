class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    begin
      auth = request.env['omniauth.auth']
      user = User.from_omniauth(auth)
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Signed in!'
    rescue OmniAuth::Strategies::OAuth2::CallbackError => e
      Rails.logger.error "OAuth2 Callback Error: #{e.message}"
      redirect_to root_path, alert: "Authentication failed: #{e.message}"
    rescue => e
      Rails.logger.error "General Error: #{e.message}"
      redirect_to root_path, alert: "Authentication failed: #{e.message}"
    end
  end







  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed out!'
  end

  def failure
    redirect_to root_path, alert: 'Authentication failed, please try again.'
  end
end
