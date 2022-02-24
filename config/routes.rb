Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :mountains, except: :index do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: [:destroy]
end
