class RemovePriceIdToRoom < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :price_id
    add_reference :prices, :room, foreign_key: true
  end
end
