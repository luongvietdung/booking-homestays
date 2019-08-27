# frozen_string_literal: true

class Area < ApplicationRecord
  belongs_to :location
  has_many :addresses, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
