# frozen_string_literal: true

class Bill < ApplicationRecord
  belongs_to :voucher, dependent: :destroy
  belongs_to :price
end
