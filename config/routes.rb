Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationship, only: [:create, :destroy]
    member do
      get 'follows'
      get 'followers'
    end
    resource :chat, only: [:show], to: 'chat#show'
  end
  resources :books do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  get 'search', to: 'search#search', as: :search
end