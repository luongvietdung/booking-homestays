# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :not_update_password

  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :timeoutable
  has_many :rooms

  validates :name, presence: true, length: { maximum: 45 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :type, presence: true
  validate :avatar_validate, if: -> { avatar.attached? }

  has_one_attached :avatar

  def timeout_in
    Settings.time_out.minutes
  end

  def avatar_validate
    return if avatar.blob.content_type.starts_with?(Settings.file_path) && avatar.blob.byte_size < Settings.max_size

    avatar.purge
    errors.add(:avatar, :not_valid)
  end

  def update_avatar(value)
    return true unless value.present?

    if value.size > Settings.max_size
      errors.add(:avatar, :size)
      false
    elsif !value.content_type.starts_with?(Settings.file_path)
      errors.add(:avatar, :format)
      false
    else
      avatar.purge_later
      update_attribute(:avatar, value)
      true
    end
  end

  protected

  def password_required?
    return false if not_update_password

    super
  end
end
