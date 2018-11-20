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

ActiveRecord::Schema.define(version: 2018_11_19_093123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "admin", default: false
    t.integer "inventory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "meal_dates", force: :cascade do |t|
    t.date "date"
    t.bigint "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_meal_dates_on_meal_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pre_order_price_cents", default: 0, null: false
    t.integer "day_price_cents", default: 0, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "meal_date_id"
    t.bigint "user_id"
    t.string "status", default: "Pending"
    t.integer "quantity", default: 1
    t.string "qr_code"
    t.boolean "pre_order", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_price_cents", default: 0, null: false
    t.jsonb "payment"
    t.index ["meal_date_id"], name: "index_orders_on_meal_date_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "meal_date_id"
    t.bigint "user_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_date_id"], name: "index_reviews_on_meal_date_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "users"
  add_foreign_key "employees", "users"
  add_foreign_key "meal_dates", "meals"
  add_foreign_key "orders", "meal_dates"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "meal_dates"
  add_foreign_key "reviews", "users"
end
