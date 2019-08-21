# frozen_string_literal: true

class FavoriteSpace < ApplicationRecord
  has_many :location_favorites, dependent: :destroy
  has_many :locations, through: :location_favorites

  validates :name, length: { in: 3..50 }, uniqueness: { case_sensitive: false }
end
