# frozen_string_literal: true

class FavoriteSpace < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :rooms, dependent: :destroy

  scope :newest, -> { order created_at: :desc }

  validates :name, length: { in: 3..50 }, uniqueness: { case_sensitive: false }
end
