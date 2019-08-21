# frozen_string_literal: true

module Manager
  class MembersController < BaseController
    def index
      @members = Member.all
    end

    def new
      @member = Member.new
    end

    def create
      @member = Member.new member_params
      if @member.save
        flash[:success] = t "messages.success.members.create"
        redirect_to manager_members_path
      else
        flash.now[:danger] = t "messages.failed.members.create"
        render :new
      end
    end

    private

    def member_params
      params.require(:member).permit :email, :name, :address,
                                     :password, :password_confirmation, :avatar
    end
  end
end
