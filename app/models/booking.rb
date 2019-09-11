# frozen_string_literal: true

class Booking < ApplicationRecord
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

  private

  def checkin_date_after_checkout_date
    return if checkin.blank? || checkout.blank?

    errors.add(:checkout, "must be after the start date") if checkout < checkin
  end
end
