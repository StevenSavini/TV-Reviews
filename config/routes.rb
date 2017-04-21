Rails.application.routes.draw do
  devise_for :users
  root to: "shows#index"
  resources :users
  resources :shows do
    resources :reviews, only: [:new, :create]
  end
end
