# frozen_string_literal: true

class Area < ApplicationRecord
  belongs_to :location

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
