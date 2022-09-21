# frozen_string_literal: true

Rails.application.routes.draw do
  root 'commerce#index'

  namespace :admin do
    resources :users
    resources :stores
    resources :vehicles
  end

  resources :commerce, only: %i[index show]
end
