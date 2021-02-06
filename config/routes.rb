Rails.application.routes.draw do
  root 'home#index'  
  
  get 'home/index'
  resources :firms
  resources :services
  resources :clients

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
