Rails.application.routes.draw do
  # Other routes
  root 'welcome#index'
  get '/auth/google_oauth2/callback', to: 'sessions#create', as: 'callback'
  get '/auth/failure', to: redirect('/')
  get '/signout', to: 'sessions#destroy', as: 'signout'
end