Rails.application.routes.draw do
  root "welcome#index"

  get "/auth/github/callback", to: "sessions#create", as: "callback"

  get "/dashboard", to: "dashboard#show"

  resources :campaigns, only: [:new, :create] do
    get '/summary', to: 'summary#show'
    get '/party', to: 'party#index'
  end
  resources :characters, only: [:new, :create]

  resources :management, only: [:edit]
end
