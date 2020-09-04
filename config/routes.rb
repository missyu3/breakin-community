Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root "places#index"
  resources :users, only: [:edit,:update]
  resources :places, except: [:show] do
    resources :messages, only: [:new, :create]
  end
  resources :user_places, only: :create
end
