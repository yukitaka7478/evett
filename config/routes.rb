Rails.application.routes.draw do
  devise_for :users
  root to: "evetts#index"
  resources :evetts, only: [:index, :new, :create]
  get "evetts/index_freind"
  get "evetts/index_user"
end