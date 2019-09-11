# frozen_string_literal: true

class Area < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :rooms
  belongs_to :location

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
