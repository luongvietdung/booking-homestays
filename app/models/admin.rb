# frozen_string_literal: true

class Admin < User
  scope :newest, -> { order updated_at: :desc }
end
