class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :address
      t.float :rating
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
