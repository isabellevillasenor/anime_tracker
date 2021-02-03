Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create]

  #this will be refactored into a session management
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'
end
