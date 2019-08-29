# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :room_images

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true
  validates :guest, presence: true, numericality: { only_integer: true }
  validates :bed_room, presence: true, numericality: { only_integer: true }
  validates :bath_room, presence: true, numericality: { only_integer: true }
  validates :type_room, presence: true

  enum type_room: { private_room: 0, entire: 1 }

  accepts_nested_attributes_for :room_images, allow_destroy: true
end
