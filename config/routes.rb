Rails.application.routes.draw do
  resources :names, only: %w(show)
  resources :lookups, only: %w(index create)
  resources :name_interests, only: %w(create show)

  root to: 'lookups#index'
end
