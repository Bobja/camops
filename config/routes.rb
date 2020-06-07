Rails.application.routes.draw do

  root 'pages#index'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users, only: [:index, :show, :edit, :update]
  
  namespace :admin do
    resources :users, only: [:index, :new, :create, :destroy]
  end
  
  resources :works, only: [:index, :show, :edit, :update]
  
  namespace :admin do
    resources :works, only: [:index, :new, :create, :destroy]
  end
  
end
