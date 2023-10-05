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

ActiveRecord::Schema[7.0].define(version: 2023_10_04_003608) do
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

  create_table "hotel_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "title"
    t.string "establishment_description"
    t.string "cnpj"
    t.float "evaluation"
    t.bigint "hotel_type_id", null: false
    t.index ["hotel_type_id"], name: "index_hotels_on_hotel_type_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  add_foreign_key "cities", "states"
  add_foreign_key "hotel_images", "hotels"
  add_foreign_key "hotel_locations", "cities"
  add_foreign_key "hotel_locations", "countries"
  add_foreign_key "hotel_locations", "hotels"
  add_foreign_key "hotel_locations", "states"
  add_foreign_key "hotels", "hotel_types"
  add_foreign_key "states", "countries"
end
