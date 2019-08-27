# frozen_string_literal: true

module Manager
  class AreasController < BaseController
    before_action :load_area, only: %i[edit update destroy]

    def create
      @area = Area.new area_params
      if @area.save
        flash[:success] = t ".success"
      else
        flash[:danger] = t ".danger"
      end
      respond_to do |format|
        format.js
      end
    end

    def edit; end

    def update
      if @area.update area_params
        flash[:success] = t ".success"
        redirect_to edit_manager_location_path(@area.location_id)
      else
        flash.now[:danger] = t ".danger"
        render :edit
      end
    end

    def destroy
      if @area.destroy
        flash[:success] = t ".success"
      else
        flash[:danger] = t ".danger"
      end
      redirect_to edit_manager_location_path(@area.location_id)
    end

    private

    def area_params
      params.require(:area).permit :name, :location_id
    end

    def load_area
      @area = Area.find params[:id]
    end
  end
end
