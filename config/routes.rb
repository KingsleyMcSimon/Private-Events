Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'session#new'
  
  # Events
  resources :events
  # Invitations
  resources :invitations
  # Sessions
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  get '/logout', to: 'session#destroy'
  # Users
  get '/signup', to: 'users#new'
  resources :users
end
