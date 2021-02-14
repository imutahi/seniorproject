Rails.application.routes.draw do
  root 'home#index'  
  
  get 'home/index'
  resources :firms
  resources :services
  resources :clients
  
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
