Rails.application.routes.draw do

  root   'gifs#index'
  get    '/login'   => 'sessions#new', as: :login
  post   '/login'   => 'sessions#create', as: :login_create
  get    '/logout'  => 'sessions#destroy', as: :logout

  resources :gifs
  resources :users

end
