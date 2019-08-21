# frozen_string_literal: true

module Manager
  class LocationsController < BaseController
    before_action :load_location, only: %i[edit update destroy]

    def index
      @locations = Location.newest.page(params[:page]).per Settings.location_per
    end

    def new
      @location = Location.new
    end

    def edit; end

    def update
      if @location.update_attributes location_params
        flash[:success] = t ".success"
        redirect_to manager_locations_path
      else
        flash.now[:danger] = t ".danger"
        render :edit
      end
    end

    def create
      @location = Location.new location_params
      if @location.save
        redirect_to manager_locations_path, flash: { success: t(".success") }
      else
        flash.now[:danger] = t ".danger"
        render :new
      end
    end

    def destroy
      if @location.destroy
        redirect_to manager_locations_path, flash: { success: t(".success") }
      else
        flash.now[:danger] = t ".danger"
        render :new
      end
    end

    private

    def location_params
      params.require(:location).permit :name
    end

    def load_location
      @location = Location.find params[:id]
    end
  end
end
