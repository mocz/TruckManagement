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

ActiveRecord::Schema[7.1].define(version: 2024_07_05_163012) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dispatches", force: :cascade do |t|
    t.bigint "truck_id", null: false
    t.bigint "location_id", null: false
    t.bigint "planter_id", null: false
    t.datetime "receive_date"
    t.integer "gross_weight"
    t.string "status"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "qr_code"
    t.index ["location_id"], name: "index_dispatches_on_location_id"
    t.index ["planter_id"], name: "index_dispatches_on_planter_id"
    t.index ["truck_id"], name: "index_dispatches_on_truck_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "license_number"
    t.string "contact_number"
    t.string "address"
    t.date "birthdate"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "barangay"
    t.string "town"
    t.string "area_code"
    t.integer "km_dist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plantations", force: :cascade do |t|
    t.string "name"
    t.bigint "location_id", null: false
    t.integer "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_plantations_on_location_id"
  end

  create_table "planters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "mobile_number"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "printers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trucks", force: :cascade do |t|
    t.string "license_plate"
    t.integer "capacity"
    t.string "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dispatches", "locations"
  add_foreign_key "dispatches", "planters"
  add_foreign_key "dispatches", "trucks"
  add_foreign_key "plantations", "locations"
end
