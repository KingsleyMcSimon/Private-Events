Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  
  # Events
  resources :events
  # Invitations
  resources :invitations
  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # Users
  resources :users
  get '/signup', to: 'users#new'
end
