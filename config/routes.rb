Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create]

  #this will be refactored into a session management
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  get '/profile', to: 'users#show'
end
