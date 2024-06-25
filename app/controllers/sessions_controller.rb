class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
  end

  def omniauth
    auth = request.env['omniauth.auth']
    # need to send the uid and username that we get back from auth to the BE
    # BE needs to find or create a user with the uid
    user = BackendFacade.get_user({
      uid: auth[:uid],
      username: auth[:info][:email]
    })

    session[:user] = user

    redirect_to dashboard_path
  end

  def create
    binding.pry

    # user = BackendFacade.get_user({
    #   username: params[:username],
    #   password: params[:password],
    # })

    # session[:user] = user

    # redirect_to dashboard_path
  end

  def destroy
    reset_session

    redirect_to root_path
  end
end
