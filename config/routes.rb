# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: "manager/sessions", passwords: "manager/passwords" }
  devise_for :members, controllers: { registrations: "registrations",
                                      sessions: "sessions", passwords: "passwords", confirmations: "confirmations" }
  root "home#index"
  get "favorite_spaces/:id", to: "home#show"
  get "autocomplete", to: "search#show"

  resources :favorite_spaces, only: [:show]
  resources :search, only: :index
  resources :autocomplete, only: :index
  resources :trends
  resources :rooms
  resources :bookings

  namespace :manager do
    root "members#index"

    resources :rooms do
      resources :prices
    end
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

    resources :trends do
      patch :convert_status, on: :member
    end

    resources :addresses, except: %i[new create]
    resources :utilities
  end
end
