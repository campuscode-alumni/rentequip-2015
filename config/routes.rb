Rails.application.routes.draw do
  resources :contracts, only: [:new, :create, :show]
  resources :customers, only: [:new, :create, :show]
  resources :equipment, only: [:new, :create, :show]
  resources :rental_period, only: [:new]
end
