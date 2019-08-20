# frozen_string_literal: true

module Manager
  class RoomsController < BaseController
    def new
      @room = current_admin.rooms.build
    end

    def edit; end

    def create
      @room = current_admin.rooms.build room_params
      if @room.save
        redirect_to manager_root_path, flash: { success: t(".create_room") }
      else
        render :new, flash: { danger: t(".can't_create") }
      end
    end

    private

    def room_params
      params.require(:room).permit :name, :address, :rate_point, :description,
                                   :guest, :type_room, :acreage, :bed_room,
                                   :bath_room, :images, :location_id
    end
  end
end
