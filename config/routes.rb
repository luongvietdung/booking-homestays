# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: "manager/sessions" }

  namespace :manager do
    root "dashboard#index"
    resources :locations
    resources :favorite_spaces, only: %i[index new create edit update]
  end
end
