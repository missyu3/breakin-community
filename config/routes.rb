Rails.application.routes.draw do
  devise_for :users
  get 'places/index'
  root "places#index"
  resources :users, only: [:edit,:update]
end
