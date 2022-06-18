Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "evetts#index"
  resources :evetts do
    resources :payments, only: [:index, :create]
  end
  resources :users, only: [:show, :update] do
    resources :cards, only: [:new, :create]
    get 'followings', to: 'freinds#followings', as: 'followings'
    get 'followeds', to: 'freinds#followeds', as: 'followeds'
    resource :friend, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end