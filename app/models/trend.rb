# frozen_string_literal: true

class Trend < ApplicationRecord
  has_many :trend_rooms, dependent: :destroy
  has_many :rooms, through: :trend_rooms

  scope :newest, -> { order created_at: :desc }

  delegate :name, to: :rooms, prefix: true
end
