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

    def edit
      @area = @location.areas.build
      @areas = @location.areas.newest.page(params[:page]).per Settings.location_per
    end

    def update
      if @location.update location_params
        redirect_to manager_locations_path, success: t(".success")
      else
        flash.now[:danger] = t ".danger"
        render :edit
      end
    end

    def create
      @location = Location.new location_params
      if @location.save
        redirect_to manager_locations_path, success: t(".success")
      else
        flash.now[:danger] = t ".danger"
        render :new
      end
    end

    def destroy
      if @location.destroy
        flash[:success] = t ".success"
      else
        flash.now[:danger] = t ".danger"
      end
      redirect_to manager_locations_path
    end

    private

    def location_params
      params.require(:location).permit :name, favorite_space_ids: []
    end

    def load_location
      @location = Location.find params[:id]
    end
  end
end
