class CreateLocationFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :location_favorites do |t|
      t.references :location, foreign_key: true
      t.references :favorite_space, foreign_key: true

      t.timestamps
    end
  end
end
