class AddPricesToRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :price, foreign_key: true
  end
end
