# frozen_string_literal: true

class Voucher < ApplicationRecord
  has_many :bills
  has_many :prices, through: :bills

  validates :code, length: { in: 6..20 }, uniqueness: true
  validates :date_off, presence: true
  validates :sale, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 101 }
  validate :date_off_after_time_now

  private

  def date_off_after_time_now
    return if date_off.blank?

    return errors.add(:date_off, "must be bigger than the current time") if
      date_off.strftime("%m/%d/%Y %T") < Time.now.strftime("%m/%d/%Y %T")
  end
end
