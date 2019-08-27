# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: "manager/sessions" }

  namespace :manager do
    root "admins#index"
    resources :favorite_spaces
    resources :rooms
    resources :admins
    resources :members
    resources :prices
    resources :locations do
      resources :areas, only: %i[new create]
    end
    resources :areas, except: %i[new create]
    resources :areas
    resources :members
  end
end
