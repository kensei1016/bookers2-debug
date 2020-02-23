Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'home#top'
  get 'home/about'

  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  resources :books
end