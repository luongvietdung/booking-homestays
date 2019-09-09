# frozen_string_literal: true

class PaymentBookingController < ApplicationController
  protect_from_forgery except: [:create]
  before_action :load_booking, only: :create

  def index; end

  def show; end

  def create
    if params[:payment_status] == Settings.COMPLETE
      @booking.update_attributes(notification_params: params,
                                 status: 1,
                                 transaction_id: params[:txn_id],
                                 purchased_at: Time.now)
      PaymentMailer.invoice_payment(@booking).deliver_now
    end
    head 200
  end

  private

  def load_booking
    @booking = Booking.includes(:room).find params[:invoice]
  end
end
