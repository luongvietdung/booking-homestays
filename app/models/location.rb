# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :areas, dependent: :destroy
  belongs_to :favorite_space, optional: true

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :newest, -> { order created_at: :desc }
end
