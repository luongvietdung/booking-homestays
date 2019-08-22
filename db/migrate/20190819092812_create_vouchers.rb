class CreateVouchers < ActiveRecord::Migration[5.2]
  def change
    create_table :vouchers do |t|
      t.string :code
      t.decimal :sale
      t.datetime :date_off

      t.timestamps
    end
  end
end
