# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: "manager/sessions" }

  namespace :manager do
    root "dashboard#index"
<<<<<<< HEAD
    resources :locations
=======
>>>>>>> #130: Destroy favorites
    resources :favorite_spaces
  end
end
