# frozen_string_literal: true

module ManagersHelper
  def select_of_types
    Room.type_rooms.keys.map { |t| [t.titleize, t] }
  end

  def build_location_for_rooms
    Location.sort_by_name.map { |l| [l.name, l.id] }
  end

  def build_area_to_location
    Area.sort_by_name.map { |a| [a.name, a.id] }
  end

  def build_favorite_space_for_rooms
    FavoriteSpace.sort_by_name.map { |fs| [fs.name, fs.id] }
  end

  def bill_vouchers(f)
    (f.price.cost - ((f.price.cost * f.voucher.sale) / 100)) + f.price.cleaning_fee
  end

  def select_favorite_space
    FavoriteSpace.all.map { |f| [f.name, f.id] }
  end

  def select_room
    Room.all.map { |r| [r.name, r.id] }
  end

  def select_status
    Trend.statuses.keys.map { |s| [s.titleize, s] }
  end

  def set_utilities
    Utility.sort_by_name
  end

  def like?(room)
    current_member.likes.find_by(room_id: room.id).present?
  end
end
