class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user
      t.datetime :checkin
      t.datetime :checkout
      t.integer :status

      t.timestamps
    end
  end
end
