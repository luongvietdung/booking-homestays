# frozen_string_literal: true

module Manager
  class UtilitiesController < BaseController
    before_action :load_utility, only: %i[edit update destroy]

    def index
      @utilities = Utility.newest.page(params[:page]).per Settings.utility_per
    end

    def new
      @utility = Utility.new
    end

    def create
      @utility = Utility.new utility_params
      if @utility.save
        redirect_to manager_utilities_path, success: t(".success")
      else
        flash.now[:danger] = t ".danger"
        render :new
      end
    end

    def edit; end

    def update
      if @utility.update utility_params
        redirect_to manager_utilities_path, success: t(".success")
      else
        flash.now[:danger] = t ".danger"
        render :dit
      end
    end

    def destroy
      if @utility.destroy
        flash[:success] = t ".success"
      else
        flash[:danger] = t ".danger"
      end
      redirect_to manager_utilities_path
    end

    private

    def utility_params
      params.require(:utility).permit :name
    end

    def load_utility
      @utility = Utility.find params[:id]
    end
  end
end
