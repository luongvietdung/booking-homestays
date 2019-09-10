# frozen_string_literal: true

class Admin < User
  scope :new_updated, -> { order updated_at: :DESC }
end
