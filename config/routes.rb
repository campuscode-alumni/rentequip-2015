Rails.application.routes.draw do
  resources :contracts, only: [:new, :create, :show]
  resources :customers, only: [:new, :create, :show]
  resources :prices, only: [:new, :create, :show]
end
