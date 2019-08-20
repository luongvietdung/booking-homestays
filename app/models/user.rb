# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :not_update_password

  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  has_many :rooms

  validates :name, presence: true, length: { maximum: 45 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :type, presence: true
  has_one_attached :avatar

  protected

  def password_required?
    return false if not_update_password

    super
  end
end
