# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :voucher

  enum status: %i[Pending Approve]

  validates :checkin, :checkout, presence: true
  validates :phone_booking, presence: true, length: { minimum: 6, maximum: 17 }
  validates :number_guest, presence: true
  validates :email_booking, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  validate :checkin_date_after_checkout_date

  def country_name
    country = ISO3166::Country[country_code]
    country.present? ? country.translations[I18n.locale.to_s] || country.name : country_code
  end

  private

  def checkin_date_after_checkout_date
    return if checkin.blank? || checkout.blank?

    errors.add(:checkout, "must be after the start date") if checkout < checkin
  end
end
