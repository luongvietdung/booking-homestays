# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: "manager/sessions", passwords: "manager/passwords" }
  devise_for :members, controllers: { registrations: "registrations", sessions: "sessions", passwords: "passwords" }
  root "home#index"
  get "favorite_spaces/:id", to: "home#show"

  resources :favorite_spaces, only: [:show]
  namespace :manager do
    root "members#index"
    resources :favorite_spaces
    resources :rooms
    resources :admins
    resources :members
    resources :prices

    resources :locations do
      resources :areas, except: %i[destroy edit update]
    end

    resources :areas, only: %i[edit update destroy] do
      resources :addresses, except: %i[destroy edit update]
    end

    resources :addresses, only: %i[destroy edit update]
  end
  root "home#index"
end
