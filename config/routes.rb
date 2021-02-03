Rails.application.routes.draw do
  resources :services
  resources :requests
  root 'clients#index'

  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
