# frozen_string_literal: true

module Manager
  class AdminsController < BaseController
    def index
      @admins = Admin.all
    end

    def new
      @admin = Admin.new
    end

    def create
      @admin = Admin.new admin_params
      if @admin.save
        flash[:success] = t "messages.success.admins.create"
      else
        flash[:danger] = t "messages.failed.admins.create"
      end
      respond_to do |format|
        format.js
      end
    end

    private

    def admin_params
      params.require(:admin).permit :email, :name, :address,
                                    :password, :password_confirmation
    end
  end
end
