Rails.application.routes.draw do

  root   'gifs#index'
  get    '/login'   => 'sessions#new', as: :login
  post   '/login'   => 'sessions#create', as: :login_create
  get    '/logout'  => 'sessions#destroy', as: :logout
  get    '/gifs/:gif_id/upvote'   => 'votes#create', as: :gif_upvote
  get    '/gifs/:gif_id/downvote' => 'votes#destroy', as: :gif_downvote


  resources :gifs
  resources :users


end
