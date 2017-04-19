Rails.application.routes.draw do
  devise_for :users
  root to: "shows#index"
  resources :shows do
    resources :users
  end

end
