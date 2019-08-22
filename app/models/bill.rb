# frozen_string_literal: true

class Bill < ApplicationRecord
  belongs_to :voucher
  belongs_to :price
end
