# frozen_string_literal: true

class Member < User
  scope :newest, -> { order updated_at: :desc }
end
