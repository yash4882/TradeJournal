Rails.application.routes.draw do
  resources :orders
  root to: "homes#index"
  resources :line_items
  resources :carts
  devise_for :users
  resources :trades
  get 'store/index'
  resources :products
end

  