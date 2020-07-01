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

ActiveRecord::Schema.define(version: 2020_07_01_115410) do

  create_table "nondas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "wine_name"
    t.string "producer"
    t.string "country"
    t.string "region"
    t.text "general_notes"
    t.integer "vintage"
    t.integer "price"
    t.date "tasted_on"
    t.integer "tasted_pts"
    t.text "tasting_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stockid"
    t.index ["user_id"], name: "index_nondas_on_user_id"
  end

  create_table "stocks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "wine_name"
    t.string "producer"
    t.string "country"
    t.string "region"
    t.text "general_notes"
    t.integer "vintage"
    t.integer "price"
    t.integer "amount"
    t.string "bought_from"
    t.date "bought_on"
    t.integer "cellar_id"
    t.text "stock_notes"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "del_flg"
    t.index ["user_id"], name: "index_stocks_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "wine_name"
    t.string "producer"
    t.string "country"
    t.string "region"
    t.text "general_notes"
    t.integer "min_price"
    t.integer "max_price"
    t.text "wishes_note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "del_flg"
    t.index ["user_id"], name: "index_wishes_on_user_id"
  end

  add_foreign_key "nondas", "users"
  add_foreign_key "stocks", "users"
  add_foreign_key "wishes", "users"
end
