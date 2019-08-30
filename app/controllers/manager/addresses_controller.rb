# frozen_string_literal: true

module Manager
  class AddressesController < BaseController
    before_action :load_address, only: %i[edit update]

    def create
      @address = Address.new address_params
      if @address.save
        flash[:success] = t ".success"
      else
        flash.now[:danger] = t ".danger"
      end
      respond_to do |format|
        format.js
      end
    end

    def edit; end

    def update
      if @address.update name: params[:name]
        flash[:success] = t ".success"
      else
        flash.now[:danger] = t ".danger"
      end
      respond_to do |format|
        format.js
      end
    end

    private

    def address_params
      params.require(:address).permit :name, :area_id
    end

    def load_address
      @address = Address.find params[:id]
    end
  end
end
