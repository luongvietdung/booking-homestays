class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name
      t.references :area, index: true, foreign_key: true

      t.timestamps
    end
  end
end
