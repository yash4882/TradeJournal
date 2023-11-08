Rails.application.routes.draw do
  resources :orders
  root to: "homes#index"

  resources :line_items do
    member do
      get :item_delete
      get :increment
      get :decrement
    end
  end
  
  resources :carts
  devise_for :users
  resources :trades
  get 'store/index'
  resources :products
end

  