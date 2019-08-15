# frozen_string_literal: true

class Detail < ApplicationRecord
  validates :guest, :type, :acreage, :bed_room, :bath_room, presence: true

  enum type: { entirehome: 0, privatehome: 1 }
end
