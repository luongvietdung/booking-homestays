# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :newest, -> { order created_at: :desc }
end
