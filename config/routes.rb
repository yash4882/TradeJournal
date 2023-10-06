Rails.application.routes.draw do
  devise_for :users
  root to: "homes#_index"
  resources :trades
end
