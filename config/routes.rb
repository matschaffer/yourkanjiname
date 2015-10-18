Rails.application.routes.draw do
  get 'transliterations/show'

  devise_for :admins

  mount RailsAdmin::Engine => '/adminui', as: 'rails_admin'

  resources :names, only: %w(show)
  resources :lookups, only: %w(index create)
  resources :name_interests, only: %w(index create show)

  resources :source_names, only: %w(show) do
    resources :transliterations
  end

  root to: 'lookups#index'
end
