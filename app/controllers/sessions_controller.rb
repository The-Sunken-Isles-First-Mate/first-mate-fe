class SessionsController < ApplicationController
  def create
    user_info = request.env["omniauth.auth"]
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_dashboard_path
    else
      redirect_to "/"
    end
  end
  
  # def new
  # end

  # def create
  # end

  # def destroy
  # end
end