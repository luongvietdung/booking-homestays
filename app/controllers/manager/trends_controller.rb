# frozen_string_literal: true

module Manager
  class TrendsController < BaseController
    def new
      @trend = Trend.new
    end

    def create
      @trend = Trend.new trend_params
      if @trend.save
        redirect_to manager_trends_path, success: t(".success")
      else
        flash.now[:danger] = t ".danger"
        render :new
      end
    end

    private

    def trend_params
      params.require(:trend).permit :name, :description
    end
  end
end
