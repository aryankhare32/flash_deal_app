# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_10_23_171702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "claimed_deals", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "deal_id", null: false
    t.bigint "buyer_id", null: false
    t.index ["buyer_id"], name: "index_claimed_deals_on_buyer_id"
    t.index ["deal_id"], name: "index_claimed_deals_on_deal_id"
  end

  create_table "deals", force: :cascade do |t|
    t.integer "total_items"
    t.decimal "price_per_item"
    t.time "start_time"
    t.time "end_time"
    t.date "date_of_launch"
    t.integer "available_items"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "seller_id", null: false
    t.index ["seller_id"], name: "index_deals_on_seller_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "claimed_deals", "buyers"
  add_foreign_key "claimed_deals", "deals"
  add_foreign_key "deals", "sellers"
end
