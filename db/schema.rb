# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_26_212943) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "hotel_images", force: :cascade do |t|
    t.string "url"
    t.bigint "hotel_id", null: false
    t.index ["hotel_id"], name: "index_hotel_images_on_hotel_id"
  end

  create_table "hotel_locations", force: :cascade do |t|
    t.decimal "positionX"
    t.decimal "positionY"
    t.string "CEP"
    t.string "nameStreet"
    t.integer "number"
    t.bigint "hotel_id", null: false
    t.bigint "country_id", null: false
    t.bigint "state_id", null: false
    t.bigint "city_id", null: false
    t.index ["city_id"], name: "index_hotel_locations_on_city_id"
    t.index ["country_id"], name: "index_hotel_locations_on_country_id"
    t.index ["hotel_id"], name: "index_hotel_locations_on_hotel_id"
    t.index ["state_id"], name: "index_hotel_locations_on_state_id"
  end

  create_table "hotel_reservations", force: :cascade do |t|
    t.integer "adults_quantity"
    t.integer "children_quantity"
    t.float "total_price", null: false
    t.date "check_in", null: false
    t.date "check_out", null: false
    t.bigint "room_id"
    t.bigint "user_id"
    t.index ["room_id"], name: "index_hotel_reservations_on_room_id"
    t.index ["user_id"], name: "index_hotel_reservations_on_user_id"
  end

  create_table "hotel_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "title"
    t.string "establishment_description"
    t.string "cnpj"
    t.float "evaluation"
    t.bigint "hotel_type_id", null: false
    t.bigint "user_id"
    t.index ["hotel_type_id"], name: "index_hotels_on_hotel_type_id"
    t.index ["user_id"], name: "index_hotels_on_user_id"
  end

  create_table "room_options", force: :cascade do |t|
    t.string "title"
    t.integer "max_people"
    t.integer "rooms_quantity"
    t.float "price_per_day"
    t.float "price_per_Person"
    t.float "price_per_PersonChild"
    t.boolean "free_wifi"
    t.boolean "is_children_free"
    t.boolean "is_refundable"
    t.bigint "hotel_id"
    t.index ["hotel_id"], name: "index_room_options_on_hotel_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "room_option_id"
    t.index ["room_option_id"], name: "index_rooms_on_room_option_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", null: false
    t.string "cpf", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cities", "states"
  add_foreign_key "hotel_images", "hotels"
  add_foreign_key "hotel_locations", "cities"
  add_foreign_key "hotel_locations", "countries"
  add_foreign_key "hotel_locations", "hotels"
  add_foreign_key "hotel_locations", "states"
  add_foreign_key "hotel_reservations", "rooms"
  add_foreign_key "hotel_reservations", "users"
  add_foreign_key "hotels", "hotel_types"
  add_foreign_key "hotels", "users"
  add_foreign_key "room_options", "hotels"
  add_foreign_key "rooms", "room_options"
  add_foreign_key "states", "countries"
end
