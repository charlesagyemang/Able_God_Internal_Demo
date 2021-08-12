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

ActiveRecord::Schema.define(version: 2021_08_11_171902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.string "meeting_days", null: false
    t.text "vision"
    t.string "motto"
    t.json "other"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leaders", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "department_id", null: false
    t.string "leader_type", null: false
    t.json "other"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_leaders_on_department_id"
    t.index ["member_id"], name: "index_leaders_on_member_id"
  end

  create_table "lineups", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.text "mc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_lineups_on_service_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.date "birthday", null: false
    t.string "phone_number", null: false
    t.boolean "primary_education", default: false
    t.boolean "secondary_education", default: false
    t.boolean "above_secondary", default: false
    t.json "other", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "twitter_name"
    t.string "facebook_name"
    t.string "phone_number_two"
    t.string "phone_number_three"
    t.string "phone_number_four"
    t.string "telegram_number"
    t.string "occupation"
    t.string "year_joined"
    t.string "whatsapp"
  end

  create_table "programmes", force: :cascade do |t|
    t.bigint "lineup_id", null: false
    t.string "name"
    t.string "facilitator"
    t.string "time_allocation_in_minutes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lineup_id"], name: "index_programmes_on_lineup_id"
  end

  create_table "services", force: :cascade do |t|
    t.date "date"
    t.integer "male_attendance"
    t.integer "female_attendance"
    t.integer "number_of_new_comers"
    t.integer "offertory_amount"
    t.integer "tithe_amount"
    t.datetime "starting_time"
    t.datetime "closing_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "service_type"
    t.bigint "leader_id", null: false
    t.index ["leader_id"], name: "index_services_on_leader_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "leaders", "departments"
  add_foreign_key "leaders", "members"
  add_foreign_key "lineups", "services"
  add_foreign_key "programmes", "lineups"
  add_foreign_key "services", "leaders"
end
