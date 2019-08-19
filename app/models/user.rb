# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  has_many :rooms

  validates :name, presence: true, length: { maximum: 45 }
  validates :address, presence: true, length: { maximum: 255 }
end
