class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.integer :guest
      t.integer :type
      t.float :acreage
      t.integer :bed_room
      t.integer :bath_room

      t.timestamps
    end
  end
end
