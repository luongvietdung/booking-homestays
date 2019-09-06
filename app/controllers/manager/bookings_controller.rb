# frozen_string_literal: true

module Manager
  class BookingsController < BaseController
    before_action :find_booking, only: %i[show edit update destroy]

    def index
      @bookings = Booking.includes(:room).newest.page(params[:page])
    end

    def show; end

    def edit; end

    def update
      if @booking.update(booking_params)
        redirect_to manager_booking_path, flash: { success: t(".success") }
      else
        render :edit
      end
    end

    def destroy
      redirect_to manager_bookings_path, flash: { success: t(".success") } if @booking.destroy
    end

    private

    def find_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:checkin, :checkout, :number_guest,
                                      :name_booking, :phone_booking, :email_booking,
                                      :name_booked, :phone_booked, :email_booked,
                                      :trip_purpose, :country_code, :request)
    end
  end
end
