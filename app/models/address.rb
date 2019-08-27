# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :area

  validates :name, presence: true
end
