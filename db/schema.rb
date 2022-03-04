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

ActiveRecord::Schema.define(version: 2022_03_04_021455) do

  create_table "stored_schedules", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "starts_at"
    t.virtual "start_month", type: :integer, as: "month(`starts_at`)", stored: true
    t.virtual "start_day", type: :integer, as: "dayofmonth(`starts_at`)", stored: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["start_month", "start_day"], name: "index_stored_schedules_on_start_month_and_start_day"
    t.index ["starts_at"], name: "index_stored_schedules_on_starts_at"
  end

  create_table "virtual_schedules", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "starts_at"
    t.virtual "start_month", type: :integer, as: "month(`starts_at`)"
    t.virtual "start_day", type: :integer, as: "dayofmonth(`starts_at`)"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["start_month", "start_day"], name: "index_virtual_schedules_on_start_month_and_start_day"
    t.index ["starts_at"], name: "index_virtual_schedules_on_starts_at"
  end

end
