# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  add_flash_types :success, :danger, :warning, :info
  devise_group :user, contains: %i[admin member]

  rescue_from ActiveRecord::RecordNotFound do
    render file: "#{Rails.root}/public/404", layout: false, status: :not_found
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || manager_root_path if resource.type == "Admin"
  end

  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path if resource_or_scope == :admin
  end
end
