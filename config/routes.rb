Rails.application.routes.draw do
  root "welcome#index"

  get "/auth/github/callback", to: "sessions#create", as: "callback"

  get "/dashboard", to: "dashboard#show"

  resources :campaigns, only: [:new, :create] do
    get '/summary', to: 'summary#show'
    get '/management', to: 'management#edit'
  end
  resources :characters, only: [:new, :create]

  resources :party, only: [:index]
end
