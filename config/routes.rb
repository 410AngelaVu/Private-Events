Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
 root 'home#index'
 resources :homes
 resources :events
 resources :users
 resources :attendances, only: [:new, :create]
end
