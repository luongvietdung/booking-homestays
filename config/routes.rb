# frozen_string_literal: true

Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root "home#index"
  get "/favorite_spaces/:id", to: "home#show"
  get "/autocomplete", to: "search#show"
  post "/mailpayment/:id", to: "mailpayment#create", as: :mailpayment
  post "/payment_update", to: "payment_booking#create", as: :payment_bookings
  get "/payment_booking/:id", to: "payment_booking#show", as: :payment_booking
  get "/payment_booking", to: "payment_booking#index", as: :thank_payment
  post "/like", to: "likes#create"
  delete "/unlike", to: "likes#destroy"
  get "/wishlist", to: "likes#wishlist"

  devise_for :admins, controllers: { sessions: "manager/sessions", passwords: "manager/passwords" }
  devise_for :members, controllers: { registrations: "registrations", sessions: "sessions",
                                      passwords: "passwords", confirmations: "confirmations" }
  get "/members/:member_id/rooms/:id/", to: "profiles#show", as: :show_profile
  get "/members/:id", to: "profiles#index", as: :index_profile

  resources :rooms do
    resources :prices
    resources :comments
  end

  resources :favorite_spaces, only: [:show]
  resources :search, only: :index
  resources :trends
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
    resources :bookings
    resources :locations do
      resources :areas, except: %i[destroy edit update]
    end

    resources :areas
    resources :trends
    resources :utilities
  end
end
