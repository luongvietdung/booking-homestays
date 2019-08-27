# frozen_string_literal: true

class Area < ApplicationRecord
  belongs_to :location
  has_many :address, dependent: :destroy

  scope :newest, -> { order created_at: :desc }

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
