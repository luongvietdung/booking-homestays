# frozen_string_literal: true

class Price < ApplicationRecord
  validates :cost, :cleaning_fee, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1_000_000 }
end
