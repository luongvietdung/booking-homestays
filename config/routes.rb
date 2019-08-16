# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :manager do
    root "dashboard#index"
    resources :favorite_spaces, only: %i[index new create]
  end
end
