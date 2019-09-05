# frozen_string_literal: true

class Member < User
  scope :new_updated, -> { order updated_at: :DESC }
  devise :confirmable
end
