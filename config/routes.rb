Rails.application.routes.draw do
  root "welcome#index"

  get "/auth/github/callback", to: "sessions#create", as: "callback"

  get "/dashboard", to: "dashboard#show"

  resources :campaigns, only: [:new, :create] do
    get '/summary', to: 'summary#show'
  end
  resources :characters, only: [:new, :create]

  resources :management, only: [:edit]
  resources :party, only: [:index]
end
