class BookingsController < ApplicationController
  def new
    return redirect_to root_path, warning: t(".warning") unless check_params_exists?
    @booking = Booking.new
    @room = Room.find params[:room_id]
    @code_vouchers = @room.price.vouchers.map{|c| c.code}
    return redirect_to root_path, warning: t(".warning") unless valid_date?
    check_valid_params
    check_valid_guest
    @night = ((@checkout - @checkin)/60/60/24).to_i.abs
  end

  def create
    if params[:code_promotion].present?
      @voucher = Voucher.find_by code: params[:code_promotion]
      @booking = Booking.new booking_params.merge(voucher_id: @voucher.id)
      save_booking
    else
      @booking = Booking.new booking_params
      save_booking
    end
  end

  private

  def booking_params
    params.require(:booking).permit :checkin, :checkout, :room_id, :number_guest,
      :name_booking, :phone_booking, :email_booking, :name_booked, :phone_booked,
      :email_booked, :country, :trip_purpose, :request, :intend_time, :voucher_id
  end

  def check_params_exists?
    (params[:room_id] && params[:checkin] && params[:checkout] && params[:guest]).present?
  end

  def check_valid_params
    @checkin = DateTime.parse(params[:checkin]).localtime
    @checkout = DateTime.parse(params[:checkout]).localtime
    return redirect_to root_path, warning: t(".warning") if @checkin >= @checkout
  end

  def check_valid_guest
    if @room.guest < params[:guest].to_i.abs || !(params[:guest] =~ /\A[-+]?[0-9]+\z/)
      return redirect_to root_path, warning: t(".warning")
    end
  end

  def valid_date?
    date_format = "%d/%m/%Y"
    if DateTime.strptime(params[:checkin], date_format) && DateTime.strptime(params[:checkout], date_format)
      return true
    end
  rescue ArgumentError
    return false
  end

  def save_booking
    if @booking.save
      redirect_to new_booking_path
    else
      flash[:danger] = t ".danger"
      redirect_to new_booking_path
    end
  end
end
