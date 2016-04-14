Rails.application.routes.draw do
  resources :gifs
  resources :users

  get    '/login'   => 'sessions#new', as: :login
  post   '/login'   => 'sessions#create', as: :login_create
  get    '/logout'  => 'sessions#destroy', as: :logout

end
