Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Events
  resources :events
  # Users
  resources :users
  # Invitations
  resources :invitations
  root 'events#index'
  # Sessions
  resources :sessions, only: [:new, :create, :destroy]  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'  
  get 'attend/:id', to: 'events#attend', as: 'attendy'
end
