Rails.application.routes.draw do
  resources :firms
  resources :services
  resources :clients
  root 'services#index'

  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
