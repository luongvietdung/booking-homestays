# frozen_string_literal: true

module Manager
  class PricesController < BaseController
    before_action :load_price, only: %i[edit update destroy]
    before_action :load_room, only: %i[edit new]

    def index
      @prices = Price.newest
    end

    def new
      @price = @room.build_price
      @price.vouchers.build
    end

    def create
      @price = Price.new price_params
      if @price.save
        redirect_to manager_room_path(@price.room_id), flash: { success: t(".success") }
      else
        render :new
      end
    end

    def edit; end

    def update
      if @price.update price_params
        redirect_to manager_room_path(@price.room_id), flash: { success: t(".success") }
      else
        render :edit
      end
    end

    def destroy
      redirect_to manager_prices_path, flash: { success: t(".success") } if @price.destroy
    end

    private

    def price_params
      params.require(:price).permit :room_id, :cost, :cleaning_fee,
                                    vouchers_attributes: %i[id code sale date_off _destroy]
    end

    def load_price
      @price = Price.find(params[:id])
    end

    def load_room
      @room = Room.find params[:room_id]
    end
  end
end
