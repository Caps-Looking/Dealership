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

ActiveRecord::Schema[7.0].define(version: 2022_08_29_214840) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "cep", null: false
    t.string "state", null: false
    t.string "city", null: false
    t.string "district", null: false
    t.string "street", null: false
    t.string "number", null: false
    t.text "complement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id", null: false
    t.index ["address_id"], name: "index_stores_on_address_id"
    t.index ["name"], name: "index_stores_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", limit: 50, null: false
    t.string "username", limit: 50, null: false
    t.integer "user_type", null: false
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["store_id"], name: "index_users_on_store_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "vehicle_images", force: :cascade do |t|
    t.text "image_data"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_vehicle_images_on_vehicle_id"
  end

  create_table "vehicle_optionals", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.text "description"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_vehicle_optionals_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "plate", null: false
    t.string "brand", limit: 50, null: false
    t.string "model", limit: 50, null: false
    t.string "version", limit: 50, null: false
    t.string "year", null: false
    t.integer "transmission", null: false
    t.integer "fuel", null: false
    t.string "color", limit: 50, null: false
    t.integer "mileage", null: false
    t.decimal "price", precision: 12, scale: 2, null: false
    t.text "description"
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_vehicles_on_store_id"
  end

  add_foreign_key "stores", "addresses"
  add_foreign_key "users", "stores"
  add_foreign_key "vehicle_images", "vehicles"
  add_foreign_key "vehicles", "stores"
end
