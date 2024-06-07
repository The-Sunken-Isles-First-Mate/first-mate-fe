Rails.application.routes.draw do
  root "welcome#index"

  get "/auth/github/callback", to: "sessions#create", as: "callback"

  get "/dashboard", to: "dashboard#show"

  resources :campaigns, only: [:new, :create] do
    get '/summary', to: 'summary#show'
    get '/management', to: 'management#edit'
    post '/management/advance', to: 'management#advance_week'
    patch '/management/update', to: 'management#update'
    get '/party', to: 'party#index'
  end

  resources :characters, only: [:new, :create]  
end
