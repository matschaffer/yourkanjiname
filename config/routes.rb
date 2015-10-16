Rails.application.routes.draw do
  resources :names, only: %w(show)
  resources :lookups, only: %w(index create)

  root to: 'lookups#index'
end
