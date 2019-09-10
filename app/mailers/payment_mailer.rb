# frozen_string_literal: true

class PaymentMailer < ApplicationMailer
  def payment_booking(booking)
    @room = booking.room
    @booking = booking
    mail to: @booking.email_booking, subject: "Payment Email"
  end

  def invoice_payment(booking)
    @room = booking.room
    @booking = booking
    mail to: @booking.email_booking, subject: "Invoice Email"
  end
end
