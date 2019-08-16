# frozen_string_literal: true

class FavoriteSpace < ApplicationRecord
  validates :name, length: { in: 3..50 }, uniqueness: true
end
