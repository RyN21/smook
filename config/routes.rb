Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #users
  get '/sign_up', to: 'users#new'
  post '/users', to: 'users#create'
  
  get '/profile', to: 'sessions#show'
end
