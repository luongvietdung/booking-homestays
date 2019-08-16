# frozen_string_literal: true

module Manager
  class LocationsController < BaseController
    def new
      @location = Location.new
    end

    def create
      @location = Location.new location_params
      if @location.save
        flash[:success] = t ".success"
        redirect_to manager_locations_path
      else
        flash[:danger] = t ".danger"
        render :new
      end
    end

    private

    def location_params
      params.require(:location).permit :name
    end
  end
end
