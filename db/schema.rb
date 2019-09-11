# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_11_063508) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_addresses_on_area_id"
  end

  create_table "areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_areas_on_location_id"
  end

  create_table "average_caches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "rater_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "avg", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_average_caches_on_rateable_type_and_rateable_id"
    t.index ["rater_id"], name: "index_average_caches_on_rater_id"
  end

  create_table "bills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "voucher_id"
    t.bigint "price_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["price_id"], name: "index_bills_on_price_id"
    t.index ["voucher_id"], name: "index_bills_on_voucher_id"
  end

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "voucher_id"
    t.datetime "checkin"
    t.datetime "checkout"
    t.integer "status"
    t.integer "number_guest"
    t.string "name_booking"
    t.string "phone_booking"
    t.string "email_booking"
    t.string "name_booked"
    t.string "phone_booked"
    t.string "email_booked"
    t.string "country_code"
    t.string "trip_purpose"
    t.text "request"
    t.time "intend_time"
    t.decimal "total_price", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notification_params"
    t.string "transaction_id"
    t.datetime "purchased_at"
    t.index ["room_id"], name: "index_bookings_on_room_id"
    t.index ["voucher_id"], name: "index_bookings_on_voucher_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_comments_on_room_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorite_spaces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_likes_on_room_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "location_favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "favorite_space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favorite_space_id"], name: "index_location_favorites_on_favorite_space_id"
    t.index ["location_id"], name: "index_location_favorites_on_location_id"
  end

  create_table "locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "overall_averages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "overall_avg", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_overall_averages_on_rateable_type_and_rateable_id"
  end

  create_table "prices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "cost", precision: 8, scale: 2
    t.decimal "cleaning_fee", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.index ["room_id"], name: "index_prices_on_room_id"
  end

  create_table "rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "rater_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.float "stars", null: false
    t.string "dimension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
    t.index ["rateable_type", "rateable_id"], name: "index_rates_on_rateable_type_and_rateable_id"
    t.index ["rater_id"], name: "index_rates_on_rater_id"
  end

  create_table "rating_caches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cacheable_type"
    t.bigint "cacheable_id"
    t.float "avg", null: false
    t.integer "qty", null: false
    t.string "dimension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"
    t.index ["cacheable_type", "cacheable_id"], name: "index_rating_caches_on_cacheable_type_and_cacheable_id"
  end

  create_table "room_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "room_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_images_on_room_id"
  end

  create_table "room_utilities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "utility_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_utilities_on_room_id"
    t.index ["utility_id"], name: "index_room_utilities_on_utility_id"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "location_id"
    t.string "name"
    t.string "address"
    t.text "description"
    t.integer "guest"
    t.integer "type_room", default: 0
    t.decimal "acreage", precision: 10
    t.integer "bed_room"
    t.integer "bath_room"
    t.integer "code_room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "favorite_space_id"
    t.bigint "area_id"
    t.index ["area_id"], name: "index_rooms_on_area_id"
    t.index ["favorite_space_id"], name: "index_rooms_on_favorite_space_id"
    t.index ["location_id"], name: "index_rooms_on_location_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "trend_rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "trend_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_trend_rooms_on_room_id"
    t.index ["trend_id"], name: "index_trend_rooms_on_trend_id"
  end

  create_table "trends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "address"
    t.string "type"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "flag", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "utilities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vouchers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.decimal "sale", precision: 10
    t.datetime "date_off"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "areas"
  add_foreign_key "areas", "locations"
  add_foreign_key "bookings", "rooms"
  add_foreign_key "bookings", "vouchers"
  add_foreign_key "comments", "rooms"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "rooms"
  add_foreign_key "likes", "users"
  add_foreign_key "location_favorites", "favorite_spaces"
  add_foreign_key "location_favorites", "locations"
  add_foreign_key "prices", "rooms"
  add_foreign_key "room_utilities", "rooms"
  add_foreign_key "room_utilities", "utilities"
  add_foreign_key "rooms", "areas"
  add_foreign_key "rooms", "favorite_spaces"
  add_foreign_key "rooms", "locations"
  add_foreign_key "rooms", "users"
  add_foreign_key "trend_rooms", "rooms"
  add_foreign_key "trend_rooms", "trends"
end
