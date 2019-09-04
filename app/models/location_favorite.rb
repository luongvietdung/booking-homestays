# frozen_string_literal: true

class LocationFavorite < ApplicationRecord
  belongs_to :location
  belongs_to :favorite_space
end
