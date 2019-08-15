# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :price
  belongs_to :location
  belongs_to :user
  belongs_to :detail
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many_attached :image
end
