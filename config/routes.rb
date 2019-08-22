# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: "manager/sessions" }

  namespace :manager do
    resources :rooms
    root "dashboard#index"
    resources :locations
    resources :favorite_spaces
    resources :admins
    resources :prices
  end
end
