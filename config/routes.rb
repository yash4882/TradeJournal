Rails.application.routes.draw do
  get 'store/index'
  devise_for :users
  root to: "homes#index"
  resources :trades
  resources :products
end
