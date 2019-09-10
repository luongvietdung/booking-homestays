# frozen_string_literal: true

# http://localhost:3000/rails/mailers/payment_mailer/payment_booking_preview
class PaymentMailerPreview < ActionMailer::Preview
  def payment_booking_preview
    PaymentMailer.payment_booking(Booking.first)
  end

  # http://localhost:3000/rails/mailers/payment_mailer/invoice_payment_preview
  def invoice_payment_preview
    PaymentMailer.invoice_payment(Booking.first)
  end
end
