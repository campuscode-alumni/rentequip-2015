Rails.application.routes.draw do

  resources :contracts, only: [:new, :create, :show]

end
