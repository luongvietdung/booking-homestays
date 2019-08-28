# frozen_string_literal: true

module Manager
  class AdminsController < BaseController
    before_action :check_default_admin
    before_action :all_admin, only: %i[index create update]
    before_action :load_admin, only: %i[edit update destroy]

    def index; end

    def new
      @admin = Admin.new
    end

    def create
      @admin = Admin.new admin_params
      @admin.avatar = params[:admin][:avatar]
      if @admin.save
        flash.now[:success] = t "messages.success.admins.create"
      else
        @admin.avatar.purge_later
        flash.now[:danger] = t "messages.failed.admins.create"
      end
    end

    def update
      support_update @admin
      if @admin.changed? || !params[:admin][:avatar].blank?
        update_admin @admin
      else
        flash.now[:notice] = t("messages.notice.admins.not_edit", id: @admin.id)
      end
    end

    def destroy
      destroy_admin @admin
      redirect_to manager_admins_path
    end

    private

    def load_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit :email, :name, :address,
                                    :password, :password_confirmation
    end

    def update_admin(admin)
      if admin.save && admin.update_avatar(params[:admin][:avatar])
        flash.now[:success] = t("messages.success.admins.update", id: admin.id)
      else
        flash.now[:danger] = t("messages.failed.admins.update", id: admin.id)
      end
    end

    def check_default_admin
      return if current_admin.flag?

      raise ActionController::RoutingError, params[:path]
    end

    def support_update(admin)
      admin.not_update_password = true if admin_params[:password].blank? && admin_params[:password_confirmation].blank?
      admin.assign_attributes admin_params
    end

    def destroy_admin(admin)
      if !admin.flag? && admin.destroy
        admin.avatar.purge_later
        flash[:success] = t("messages.success.admins.delete", id: admin.id)
      else
        flash[:danger] = t("messages.failed.admins.delete", id: admin.id)
      end
    end

    def all_admin
      @admins = Admin.newest
    end
  end
end
