class SessionsController < ApplicationController
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

  # def create
  #   client_id = "Ov23lisDr3te8NGMI0MW"
  #   client_secret = "4638256eea5ccaa7162bd896d521fed3af181509"
  #   code = params[:code]

  #   conn = Faraday.new(url: 'https://github.com', headers: {'Accept': 'application/json'})
  #   response = conn.post('/login/oauth/access_token') do |req|
  #     req.params['code'] = code
  #     req.params['client_id'] = client_id
  #     req.params['client_secret'] = client_secret
  #   end
  #   data = JSON.parse(response.body, symbolize_names: true)

  #   access_token = data[:access_token]

  #   conn = Faraday.new(url: 'https://api.github.com', headers: {'Authorization': "token #{access_token}"})
  #   response = conn.get('/user')
  #   data = JSON.parse(response.body, symbolize_names: true)

  #   user = BackendFacade.get_user({
  #     uid: data[:id],
  #     username: data[:login],
  #     token: access_token
  #   })

  #   session[:user] = user

  #   redirect_to dashboard_path
  # end

  def destroy
  end
end