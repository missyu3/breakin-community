Rails.application.routes.draw do
  devise_for :users
  root "places#index"
  resources :users, only: [:edit,:update]
  resources :places do
    resources :messages, only: [:new, :create]
  end
end
