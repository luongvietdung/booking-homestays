# frozen_string_literal: true

module Manager
  class MembersController < BaseController
    before_action :all_member, only: %i[index create update]
    before_action :load_member, only: %i[edit update destroy]

    def index; end

    def new
      @member = Member.new
    end

    def create
      @member = Member.new member_params
      if @member.save
        flash.now[:success] = t "messages.success.members.create"
      else
        flash.now[:danger] = t "messages.failed.members.create"
      end
    end

    def update
      support_update @member
      if @member.changed?
        update_member @member
      else
        flash.now[:notice] = t("messages.notice.members.not_edit", id: @member.id)
      end
    end

    def destroy
      if @member.destroy
        flash[:success] = t("messages.success.members.delete", id: @member.id)
      else
        flash[:danger] = t("messages.failed.members.delete", id: @member.id)
      end
      redirect_to manager_members_path
    end

    private

    def member_params
      params.require(:member).permit :email, :name, :address,
                                     :password, :password_confirmation, :avatar
    end

    def load_member
      @member = Member.find(params[:id])
    end

    def update_member(member)
      if member.save
        flash.now[:success] = t("messages.success.members.update", id: member.id)
      else
        flash.now[:danger] = t("messages.failed.members.update", id: member.id)
      end
    end

    def support_update(member)
      member.not_update_password = true if member_params[:password]
                                           .blank? && member_params[:password_confirmation].blank?
      member.assign_attributes member_params
    end

    def all_member
      @members = Member.newest
    end
  end
end
