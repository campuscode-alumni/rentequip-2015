Rails.application.routes.draw do
  root 'contracts#index'

  resources :contracts, only: [:new, :create, :show, :index] do
    resources :bills, only: [:create, :show]
  end

  resources :customers, only: [:new, :create, :show, :index, :edit, :update]
  resources :prices, only: [:new, :create, :show]
  resources :equipment, only: [:new, :create, :show, :index, :edit, :update]
  resources :rental_periods, only: [:new, :create, :show, :index, :edit, :update]
  resources :suppliers, only: [:new, :create, :show, :index, :edit, :update]
  resources :equipment_categories, only: [:new, :show, :create, :index, :edit,
                                          :update]
end
