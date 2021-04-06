Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  #users
  get '/sign_up', to: 'users#new'
  get '/users', to: 'devise#new'
  # post '/users', to: 'users#create'

  get '/profile', to: 'sessions#show'
end
