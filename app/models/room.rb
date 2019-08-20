# frozen_string_literal: true

class Room < ApplicationRecord
  has_many_attached :images
  belongs_to :location
  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true
  validates :guest, presence: true, numericality: { only_integer: true }
  validates :bed_room, presence: true, numericality: { only_integer: true }
  validates :bath_room, presence: true, numericality: { only_integer: true }
  validates :type_room, presence: true

  enum type_room: { private_room: 0, entire: 1 }
end
