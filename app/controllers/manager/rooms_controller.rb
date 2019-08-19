# frozen_string_literal: true

module Manager
  class RoomsController < BaseController
    before_action :load_room, only: %i[edit update show destroy]

    def index
      @rooms = Room.sort_by_name
    end

    def new
      session[:room_params] ||= {}
      @room = Room.new(session[:room_params])
      @room.room_images.build
      @room.current_step = session[:room_step]
    end

    def edit; end

    def show
      @room_utilities = @room.utilities
    end

    def create
      session[:room_params].deep_merge!(room_params) if room_params
      @room = current_admin.rooms.build session[:room_params]
      @room.current_step = session[:room_step]
      btn_action_step @room
    end

    def update
      if @room.update room_params
        upload_images if params[:room_images]
        redirect_to manager_room_path(@room), success: t(".update_success")
      else
        render :edit, danger: t(".update_fail")
      end
    end

    def destroy
      if @room.destroy
        flash[:success] = t ".deleted_success"
      else
        flash[:danger] = t ".deleted_fail"
      end
      redirect_to manager_rooms_path
    end

    private

    def room_params
      params.require(:room).permit :name, :address, :rate_point, :description,
                                   :guest, :type_room, :acreage, :bed_room,
                                   :bath_room, :location_id, utility_ids: [],
                                                             room_images_attributes: %i[id room_id image _destroy]
    end

    def load_room
      @room = Room.find params[:id]
    end

    def upload_images
      params[:room_images]["image"].each do |a|
        @room_images = @room.room_images.create!(image: a)
      end
    end

    def btn_action_step(room)
      if room.valid?
        if params[:back_button]
          room.previous_step
        elsif room.last_step?
          room.save if room.all_valid?
          session.delete(:room_step)
          session.delete(:room_params)
          upload_images if params[:room_images]
          redirect_to manager_room_path(room), success: t(".create_room")
          return
        else
          room.next_step
        end
        session[:room_step] = room.current_step
      end
      if room.last_step?
        redirect_to new_manager_room_path
      else
        render :new
      end
    end
  end
end
