# frozen_string_literal: true

class MailpaymentController < ApplicationController
  def create
    @booking = Booking.includes(:room).find(params[:id])
    PaymentMailer.payment_booking(@booking).deliver_now
    flash[:notice] = t "messages.notice.mailpayment.sent_mail", email: @booking.email_booking.to_s
    redirect_to manager_bookings_path
  end
end
