class UsersController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    if params[:password] == params[:password_confirmation]
      user = BackendFacade.get_user({
        uid: SecureRandom.base64.tr('+/=', 'Qrt'),
        username: params[:username],
        password: params[:password]
      })

      redirect_to root_path
    else
      flash[:error] = 'These passwords do not match'
    end
  end
end
