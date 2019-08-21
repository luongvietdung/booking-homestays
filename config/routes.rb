# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: "manager/sessions" }

  namespace :manager do
    root "prices#index"

    resources :favorite_spaces, only: %i[index new create]
    resources :rooms
    resources :locations
    resources :favorite_spaces
    resources :admins
    resources :prices
  end
end
