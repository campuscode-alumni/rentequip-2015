Rails.application.routes.draw do
  resources :contracts, only: [:new, :create, :show]
  resources :customers, only: [:new, :create, :show, :index]
  resources :prices, only: [:new, :create, :show]
  resources :equipment, only: [:new, :create, :show, :index]
  resources :rental_periods, only: [:new, :create, :show]
  resources :suppliers, only: [:new, :create, :show]
end
