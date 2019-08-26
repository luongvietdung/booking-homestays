class Area < ApplicationRecord
  belongs_to :location

  scope :newest, -> { order created_at: :desc }

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
