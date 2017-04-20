Rails.application.routes.draw do
  devise_for :users
  root to: "shows#index"
  resources :shows
  resources :users
end
