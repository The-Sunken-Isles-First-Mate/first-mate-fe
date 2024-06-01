Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
    scope: 'userinfo.email, userinfo.profile',
    prompt: 'select_account',
    state: -> { SecureRandom.hex(24) }
  }
end





