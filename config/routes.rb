Rails.application.routes.draw do
  root "welcome#index"

  get "/auth/github/callback", to: "sessions#create", as: "callback"

  get "/dashboard", to: "dashboard#show"

  resources :campaigns, only: [:new, :create]
  resources :characters, only: [:new, :create]
end
