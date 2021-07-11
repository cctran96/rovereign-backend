Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update]
      resources :experiences, only: [:index]
      resources :characters, only: [:index]
      resources :items, only: [:index]
      resources :skills, only: [:index]
      resources :user_characters, only: [:create, :update, :destroy]
      resources :inventory_items, only: [:create, :destroy]
      resources :maps
      resources :monsters, only: [:index]
      resources :drops
      post '/login', to: 'authentication#login'
      get '/login', to: 'authentication#user'
    end
  end
end
