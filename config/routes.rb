# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: "manager/sessions" }

  namespace :manager do
    resources :rooms
    root "dashboard#index"
    resources :locations
    resources :favorite_spaces
    resources :rooms
    resources :admins
    resources :members
    resources :prices
    resources :locations do
      resources :areas, only: %i[new create]
    end
    resources :areas, except: %i[new create] do
      resources :address
    end
  end
end
