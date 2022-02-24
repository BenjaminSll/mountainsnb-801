Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :mountains, except: :index do
    resources :bookings, only: [:new, :create, :edit, :update]
  end
  resources :bookings, only: [:destroy]
  post 'users/:id/dashboard', to: 'bookings#accept', as: :booked
  get 'users/:id/dashboard', to: 'pages#dashboard'
end
