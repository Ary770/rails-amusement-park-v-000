Rails.application.routes.draw do
  root 'sessions#index'
  get '/signup' => 'user#new'
  get '/signin' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  resources :rides
  resources :attractions
  resources :users
  resources :sessions
end