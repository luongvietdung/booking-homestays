# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 45 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :type, presence: true
end
