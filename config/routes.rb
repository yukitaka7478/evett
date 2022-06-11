Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users
  root to: "evetts#index"
  resources :evetts do
    resources :payments, only: [:index, :create]
  end
  resources :users, only: [:show, :update] do
    resources :cards, only: [:new, :create]
  end
end