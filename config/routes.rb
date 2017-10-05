Rails.application.routes.draw do
  root to: 'dashboard#show'

  resources :carts, only: [:create]
  put    '/carts', to: 'carts#update'
  delete '/carts', to: 'carts#destroy'
  get    '/cart', to: 'carts#index'

  resources :orders, only: [:new, :create, :index, :show, :update] do
    resource :receipt
  end

  resources :products, only: [:index, :show] do 
  end

  resources :users, only: [:new, :create, :edit, :update] 

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
