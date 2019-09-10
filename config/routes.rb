# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: "manager/sessions", passwords: "manager/passwords" }
  devise_for :members, controllers: { registrations: "registrations",
                                      sessions: "sessions", passwords: "passwords", confirmations: "confirmations" }
  root "home#index"
  get "/favorite_spaces/:id", to: "home#show"
  get "/autocomplete", to: "search#show"
  post "/mailpayment/:id", to: "mailpayment#create", as: :mailpayment
  post "/payment_update", to: "payment_booking#create", as: :payment_bookings
  get "/payment_booking/:id", to: "payment_booking#show", as: :payment_booking
  get "/payment_booking", to: "payment_booking#index", as: :thank_payment

  resources :favorite_spaces, only: [:show]
  resources :search, only: :index
  resources :autocomplete, only: :index
  namespace :manager do
    root "members#index"
    resources :favorite_spaces
    resources :rooms
    resources :admins
    resources :members
    resources :prices
    resources :bookings

    resources :locations do
      resources :areas, except: %i[destroy edit update]
    end

    resources :areas, only: %i[edit update destroy] do
      resources :addresses, except: %i[destroy edit update]
    end

    resources :addresses, only: %i[destroy edit update]
  end
end
