class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.string :content
      t.integer :rate

      t.timestamps
    end
  end
end
