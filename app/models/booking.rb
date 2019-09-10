class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :voucher, optional: true

  validates :checkin, :checkout, :room_id, :number_guest, :name_booking,
    :phone_booking, :email_booking, :country, presence: true
end
