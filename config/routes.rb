Rails.application.routes.draw do
  root "welcome#index"

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  # get "up" => "rails/health#show", as: :rails_health_check
end
