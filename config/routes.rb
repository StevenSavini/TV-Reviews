Rails.application.routes.draw do
  devise_for :users
  root to: "shows#index"
  resources :users
  resources :shows, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :edit, :update]
  end
end
