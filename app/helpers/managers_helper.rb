# frozen_string_literal: true

module ManagersHelper
  def select_of_types
    Room.type_rooms.keys.map { |t| [t.titleize, t] }
  end

  def build_location_for_rooms
    Location.sort_by_name.map { |l| [l.name, l.id] }
  end

  def set_utilities
    Utility.sort_by_name
  end

  def build_images_for_room
    @room.room_images.build
  end

  def bill_vouchers(f)
    (f.price.cost - ((f.price.cost * f.voucher.sale) / 100)) + f.price.cleaning_fee
  end

  def select_room
    Room.all.map { |r| [r.name, r.id] }
  end

  def set_status(object)
    if object.active?
      link_to("Active", convert_status_manager_trend_path(object),
              method: :patch, remote: true, class: "btn info custom-btn", id: "btn-set-#{object.id}")
    else
      link_to("Inactive", convert_status_manager_trend_path(object),
              method: :patch, remote: true, class: "btn info custom-btn", id: "btn-set-#{object.id}")
    end
  end

  def select_favorite_space
    FavoriteSpace.all.map { |f| [f.name, f.id] }
  end
end
