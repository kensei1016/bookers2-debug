Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'

  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationship, only: [:create, :destroy]
  end
  resources :books do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end