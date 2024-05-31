Rails.application.routes.draw do
  root "welcome#index"

  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/google_oauth2", as: "provider_login"

  #resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  # get "up" => "rails/health#show", as: :rails_health_check
end
