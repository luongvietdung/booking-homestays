# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :areas, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
