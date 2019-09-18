# frozen_string_literal: true

class Booking < ApplicationRecord
  before_save :downcase_email, :add_total_price

  belongs_to :room
  belongs_to :voucher, optional: true

  validates :checkin, :checkout, :room_id, :number_guest, :name_booking,
            :phone_booking, :email_booking, presence: true

  enum status: %i[Pending Approve]

  validates :phone_booking, length: { minimum: 6, maximum: 17 }
  validates :email_booking, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  validate :checkin_date_after_checkout_date

  def country_name
    country = ISO3166::Country[country_code]
    country.present? ? country.translations[I18n.locale.to_s] || country.name : country_code
  end

  def paypal_url(_return_path)
    values = {
      business: Settings.email.to_s,
      cmd: "_xclick",
      upload: 1,
      return: "#{Settings.app_host}#{Settings.thank_path}",
      invoice: id,
      amount: total_price,
      item_name: room.name,
      item_number: room.id,
      notify_url: "#{Settings.app_host}/payment_update"
    }
    "#{Settings.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def create_booking_digest
    update_attributes(booking_digest: Booking.new_token,
                      booking_sent_at: Time.zone.now)
  end

  def booking_expired?
    booking_sent_at < 1.hours.ago
  end

  def checkin_date_after_checkout_date
    return if checkin.blank? || checkout.blank?

    errors.add(:checkout, "must be after the start date") if checkout < checkin
  end

  private

  def add_total_price
    total_price = (room.price.cost * ((checkout - checkin) / 86_400))
    self.total_price = if voucher_id.present?
                         (total_price - ((total_price * voucher.sale) / 100)) + room.price.cleaning_fee
                       else
                         total_price + room.price.cleaning_fee
                       end
  end

  def downcase_email
    self.email_booking = email_booking.downcase
  end
end
