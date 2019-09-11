class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :room, foreign_key: true
      t.references :voucher, foreign_key: true
      t.datetime :checkin
      t.datetime :checkout
      t.integer :status, dafault: 0
      t.integer :number_guest
      t.string :name_booking
      t.string :phone_booking
      t.string :email_booking
      t.string :name_booked
      t.string :phone_booked
      t.string :email_booked
      t.string :country_code
      t.string :trip_purpose
      t.text :request
      t.time :intend_time
      t.decimal :total_price
      t.string :booking_digest
      t.datetime :booking_sent_at

      t.timestamps
    end
  end
end
