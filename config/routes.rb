# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: "manager/sessions", passwords: "manager/passwords" }
  devise_for :members, controllers: { registrations: "registrations",
    sessions: "sessions", passwords: "passwords", confirmations: "confirmations" }

  namespace :manager do
    root "members#index"
    resources :favorite_spaces
    resources :rooms
    resources :admins
    resources :members
    resources :prices
    resources :locations do
      resources :areas, only: %i[new create]
    end
    resources :areas, except: %i[new create] do
      resources :addresses, only: %i[new create]
    end
    resources :addresses, only: %i[destroy edit update]
  end
  root "home#index"
end
