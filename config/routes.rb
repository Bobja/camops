Rails.application.routes.draw do

  root 'pages#index'
  
  resources :users
  
  namespace :admin do
    resources :users, only: [:index, :new, :create, :destroy]
  end
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
