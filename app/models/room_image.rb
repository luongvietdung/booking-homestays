# frozen_string_literal: true

class RoomImage < ApplicationRecord
  belongs_to :room
  mount_uploader :image, ImageUploader

  validates :image, presence: true
end
