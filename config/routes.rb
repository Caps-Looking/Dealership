# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'admin/stores#index'

  namespace :admin do
    resources :users
    resources :stores
  end
end
