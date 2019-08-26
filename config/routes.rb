# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: "manager/sessions" }

  namespace :manager do
    root "prices#index"

    resources :favorite_spaces
    resources :rooms
    resources :admins
    resources :prices

    resources :locations do
      resources :areas
    end

    resources :areas, only: %i[index update edit destroy]
  end
end
