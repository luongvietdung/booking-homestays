# frozen_string_literal: true

class Area < ApplicationRecord
  belongs_to :location
  has_many :addresses, dependent: :destroy
  has_many :rooms

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
