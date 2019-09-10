class Utility < ApplicationRecord
  has_many :room_utilities, dependent: :destroy
  has_many :rooms, through: :room_utilities

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
