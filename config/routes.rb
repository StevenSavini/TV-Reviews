Rails.application.routes.draw do
  devise_for :users
  root to: "shows#index"
  resources :users
  resources :shows, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :edit, :update]
    resources :favorites, only: [:new, :create]
  end
<<<<<<< HEAD
  resources :favorites, only: [:destroy]
=======
  resources :reviews, only: [:show, :destroy]
>>>>>>> 0b447e27d96e146ba384bc382bf56e64b70aff0e
end
