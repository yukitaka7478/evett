Rails.application.routes.draw do
  devise_for :users
  root to: "evetts#index"
  resources :evetts, only: [:index, :new, :create, :show, :edit, :update]
  get "evetts/index"
end