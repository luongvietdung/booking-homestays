module Manager
  class LocationsController < BaseController
    def new
      @location = Location.new
    end

    def create
      @location = Location.new location_params
      if @location.save
        redirect_to manager_locations_path, success: t ".success"
      else
        render :new, danger: t".danger"
      end
    end

    private

    def location_params
      params.require(:location).permit :name
    end
  end
end
