# frozen_string_literal: true

module Manager
  class PricesController < BaseController
    before_action :price, only: %i[edit update]

    def index
      @prices = Price.newest
    end

    def new
      @price = Price.new
    end

    def create
      @price = Price.new(price_params)
      if @price.save
        redirect_to manager_prices_path, flash: { success: t(".success") }
      else
        render :new
      end
    end

    def edit; end

    def update
      if @price.update(price_params)
        redirect_to manager_prices_path, flash: { success: t(".success") }
      else
        render :edit
      end
    end

    private

    def price_params
      params.require(:price).permit(:cost, :cleaning_fee)
    end

    def price
      @price = Price.find(params[:id])
    end
  end
end
