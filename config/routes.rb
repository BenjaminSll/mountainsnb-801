Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get /users/:id/dashboard, to: 'pages#dashboard'
  # post '/users/:id/dashboard', to: 'bookings#accept', as: :booked

  get 'dashboard', to: 'pages#dashboard'

  resources :mountains, except: [:index] do
    resources :bookings, only: [:new, :create, :edit, :update]
  end
  resources :bookings, only: [:destroy] do
    post :accept
  end
end
