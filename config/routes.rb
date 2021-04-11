Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'home#index'

  get '/sign_in', to: 'sessions#new'
  #users
  namespace :users do
    get '/sign_up', to: 'registrations#new'
  end
  # get '/users', to: 'users#new'
  # post '/users', to: 'users#create'

  get '/profile', to: 'sessions#show'
end
