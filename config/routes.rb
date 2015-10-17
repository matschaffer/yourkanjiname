Rails.application.routes.draw do
  devise_for :admins

  mount RailsAdmin::Engine => '/adminui', as: 'rails_admin'

  resources :names, only: %w(show)
  resources :lookups, only: %w(index create)
  resources :name_interests, only: %w(index create show)

  root to: 'lookups#index'
end
