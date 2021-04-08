Rails.application.routes.draw do
  get 'store/index'
  root 'home#index'  
  
  get 'home/index'
  get 'home/show'
  get 'home/about'
  resources :firms
  resources :services
  resources :clients
  resources :downloads
  resources :charges
  
  resources :pages do 
    collection do
      get :clients
      get :services
      get :firms
    end
  end
  
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/logout' => 'logout#logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
