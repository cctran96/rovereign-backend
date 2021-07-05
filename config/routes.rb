Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update]
      resources :characters, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :skills, only: [:index, :show]
      resources :user_characters, only: [:create, :update, :destroy]
      resources :inventory_items, only: [:create, :destroy]
      resources :user_character_skills, only: [:create, :destroy]
      post '/login', to: 'authentication#login'
      get '/login', to: 'authentication#user'
      resources :maps
      resources :monsters
      resources :drops
      resources :experiences, only: [:index]
    end
  end
end
