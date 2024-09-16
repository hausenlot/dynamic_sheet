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

ActiveRecord::Schema[7.0].define(version: 2024_09_13_070938) do
  create_table "onetables", charset: "utf8mb4", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "prefix"
    t.string "suffix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "threetables", charset: "utf8mb4", force: :cascade do |t|
    t.string "primary_school"
    t.string "secondary_school"
    t.string "university"
    t.string "degree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "onetable_id", null: false
    t.index ["onetable_id"], name: "index_threetables_on_onetable_id"
  end

  create_table "twotables", charset: "utf8mb4", force: :cascade do |t|
    t.string "street_address"
    t.integer "building_number"
    t.string "city"
    t.string "country"
    t.integer "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "onetable_id", null: false
    t.index ["onetable_id"], name: "index_twotables_on_onetable_id"
  end

  add_foreign_key "threetables", "onetables"
  add_foreign_key "twotables", "onetables"
end
