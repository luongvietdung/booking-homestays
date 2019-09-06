class AddFavoriteSpaceAndAreaToRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :favorite_space, foreign_key: true
    add_reference :rooms, :area, foreign_key: true
  end
end
