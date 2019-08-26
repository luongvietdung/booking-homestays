class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.references :voucher, references: true
      t.references :price, references: true

      t.timestamps
    end
  end
end
