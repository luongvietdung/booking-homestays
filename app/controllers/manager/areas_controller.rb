# frozen_string_literal: true

module Manager
  class AreasController < BaseController
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

    private

    def area_params
      params.require(:area).permit :name, :location_id
    end
  end
end
