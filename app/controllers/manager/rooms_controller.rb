# frozen_string_literal: true

module Manager
  class RoomsController < BaseController
    before_action :load_room, only: %i(edit update show)

    def index
      @rooms = Room.sort_by_name
    end

    def new
      @room = current_admin.rooms.build
    end

    def edit; end

    def show; end

    def create
      @room = current_admin.rooms.build room_params
      if @room.save
        redirect_to manager_root_path, flash: { success: t(".create_room") }
      else
        render :new, flash: { danger: t(".can't_create") }
      end
    end

    def update
      if @room.update_attributes room_params
        redirect_to manager_room_path(@room), flash: {success: t(".update_success")}
      else
        render :edit, flash: {danger: t(".update_fail")}
      end
    end

    def destroy
      redirect_to manager_rooms_path, flash: {success: t(".deleted_success")} if @room.destroy
    end

    private

    def room_params
      params.require(:room).permit :name, :address, :rate_point, :description,
                                   :guest, :type_room, :acreage, :bed_room,
                                   :bath_room, :location_id, images: []
    end

    def load_room
      @room = Room.find params[:id]
    end
  end
end
