class BookingsController < ApplicationController
  def new
    return redirect_to root_path, warning: t(".warning") unless check_params_exists?
    @booking = Booking.new
    @room = Room.find params[:room_id]
    return redirect_to root_path, warning: t(".warning") if @room.guest < params[:guest].to_i.abs
  end

  def create
    @booking = Booking.new booking_params
    if @booking.save!
      redirect_to new_booking_info_path
    else
      flash[:danger] = t ".danger"
      redirect_to room_path(booking_params[:room_id])
    end
  end

  private

  def booking_params
    params.require(:booking).permit :checkin, :checkout, :room_id, :number_guest,
      :name_booking, :phone_booking, :email_booking, :name_booked, :phone_booked,
      :email_booked, :country, :trip_purpose, :request, :intend_time
  end

  def check_params_exists?
    (params[:room_id] && params[:checkin] && params[:checkout] && params[:guest] && params[:night]).present?
  end

  def check_info_booking_session
    info_booking = Digest::MD5.hexdigest(params[:room_id] + params[:checkin] + params[:checkout] + params[:guest] + params[:night])
    if session[:info_booking].blank?
      session[:info_booking] = info_booking
      return true
    end
    if session[:info_booking] != info_booking
      return false
    end
    return true
  end
end
