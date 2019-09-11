# frozen_string_literal: true

module Manager
  class BaseController < ApplicationController
    layout "manager"
    protect_from_forgery with: :exception
    before_action :authenticate_admin!
  end
end
