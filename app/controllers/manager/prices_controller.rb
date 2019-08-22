# frozen_string_literal: true

module Manager
  class PricesController < BaseController
    before_action :price, only: %i[edit update destroy]

    def index
      @prices = Price.newest
    end
    
    def new
      @price = Price.new
      @price.vouchers.build
    end

    def create
      @price = Price.new(price_params)
      if @price.save
        redirect_to manager_prices_path, flash: { success: t(".success") }
      else
        render :new
      end
    end

    def edit
      @price.vouchers.build
    end

    def update
      if @price.update(price_params)
        redirect_to manager_prices_path, flash: { success: t(".success") }
      else
        render :edit
      end
    end

    def destroy
      redirect_to manager_prices_path, flash: { success: t(".success") } if @price.destroy
    end

    private

    def price_params
      params.require(:price).permit(:cost, :cleaning_fee, vouchers_attributes: %i[id code sale date_off _destroy])
    end

    def price
      @price = Price.find(params[:id])
    end
  end
end
