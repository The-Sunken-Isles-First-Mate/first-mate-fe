class SessionsController < ApplicationController
  def new
  end

  def create
    client_id = "Ov23lisDr3te8NGMI0MW"
    client_secret = "4638256eea5ccaa7162bd896d521fed3af181509"
    code = params[:code]

    conn = Faraday.new(url: 'https://github.com', headers: {'Accept': 'application/json'})
    response = conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
    end
    data = JSON.parse(response.body, symbolize_names: true)

    access_token = data[:access_token]

    conn = Faraday.new(url: 'https://api.github.com', headers: {'Authorization': "token #{access_token}"})
    response = conn.get('/user')
    data = JSON.parse(response.body, symbolize_names: true)

    # This is for when we DO have the API call implemented
    user = BackendFacade.get_user({
      uid: data[:id],
      username: data[:login],
      token: access_token
    })

    session[:user] = user
  
    # This is for when we DO NOT have the API call implemented
    # user          = User.find_or_create_by(uid: data[:id])
    # user.username = data[:login]
    # user.uid      = data[:id]
    # user.token    = access_token
    # user.save
    
    # session[:user] = user.id

    redirect_to dashboard_path
  end

  def destroy
  end
end