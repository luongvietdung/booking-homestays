# frozen_string_literal: true

class Room < ApplicationRecord
  attr_writer :current_step
  attr_accessor :home, :content

  STEPS = %w[home content confirmation].freeze

  has_many :room_utilities, dependent: :destroy
  has_many :utilities, through: :room_utilities
  has_many :trend_rooms, dependent: :destroy
  has_many :room_images, dependent: :destroy
  has_many :trends, through: :trend_rooms
  has_many :bookings, dependent: :destroy
  has_one :price, dependent: :destroy
  has_one :booking, dependent: :destroy
  belongs_to :user
  belongs_to :location
  belongs_to :favorite_space
  belongs_to :area
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :address, :name, :type_room, presence: true, if: :step_home?
  validates :guest, :bed_room, :bath_room, presence: true,
                                           numericality: { only_integer: true }, if: :step_content?

  enum type_room: { Nhà_Riêng: 0, Căn_Hộ: 1 }

  accepts_nested_attributes_for :room_images, allow_destroy: true
  ratyrate_rateable "rating_room"

  delegate :name, to: :area, prefix: true
  delegate :name, to: :favorite_space, prefix: true
  delegate :name, to: :location, prefix: true
  delegate :name, :type, to: :user, prefix: true
  delegate :cost, :cleaning_fee, to: :price, prefix: true

  scope :by_like_room, ->(room_ids) { where id: room_ids }

  def current_step
    @current_step || STEPS.first
  end

  def next_step
    self.current_step = STEPS[STEPS.index(current_step) + 1]
  end

  def previous_step
    self.current_step = STEPS[STEPS.index(current_step) - 1]
  end

  def first_step?
    current_step == STEPS.first
  end

  def last_step?
    current_step == STEPS.last
  end

  def all_valid?
    STEPS.all? do |step|
      self.current_step = step
      valid?
    end
  end

  private

  def step_content?
    current_step == STEPS[1]
  end

  def step_home?
    current_step == STEPS[0]
  end
end
