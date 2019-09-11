# frozen_string_literal: true

class MailpaymentController < ApplicationController
  before_action :load_booking, only: :edit
  before_action :check_token, only: :edit
  before_action :check_expire_time, only: :edit

  def create
    @booking = Booking.includes(:room).find_by(id: params[:id])
    if @booking&.Pending?
      @booking.create_booking_digest
      PaymentMailer.payment_booking(@booking).deliver_now
      flash[:notice] = t "messages.notice.mailpayment.sent_mail", email: @booking.email_booking.to_s
    else
      flash[:danger] = t "messages.failed.mailpayment.sent_mail"
    end
    redirect_to manager_bookings_path
  end

  def edit
    if @booking.Pending?
      redirect_to @booking.paypal_url(payment_booking_path(@booking))
    else
      flash[:danger] = t "messages.failed.mailpayment.paymented"
      redirect_to root_path
    end
  end

  private

  def check_token
    return if @booking.booking_digest == params[:id]

    flash[:danger] = t "messages.failed.mailpayment.token"
    redirect_to root_path
  end

  def load_booking
    @booking = Booking.includes(:room).find_by(id: params[:booking])
    return if @booking

    flash[:danger] = t "messages.failed.mailpayment.sent_mail"
    redirect_to root_path
  end

  def check_expire_time
    return unless @booking.booking_expired?

    @booking.destroy
    flash[:danger] = t "messages.failed.mailpayment.expire"
    redirect_to root_path
  end
end
