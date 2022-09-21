# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect('/commerce')

  namespace :admin do
    resources :users
    resources :stores
    resources :vehicles
  end

  resources :commerce, only: %i[index show]
end
