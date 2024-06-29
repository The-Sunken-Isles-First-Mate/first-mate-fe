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
    user = BackendFacade.get_user_all({
      username: params[:username],
      password: params[:password]
    })

    if user.is_a?(User)
      session_user = BackendFacade.get_user({
        uid: user.id,
        username: params[:username],
        password: params[:password]
      })

      session[:user] = session_user

      redirect_to dashboard_path
    else
      flash[:error] = 'Bad credentials. Please try again.'
      redirect_to root_path
    end
  end

  def destroy
    reset_session

    redirect_to root_path
  end
end
