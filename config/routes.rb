Rails.application.routes.draw do
  root to: "homes#index"
  resources :line_items
  resources :carts
  devise_for :users
  resources :trades
  get 'store/index'
  resources :products
end

  