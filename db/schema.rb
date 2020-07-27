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

ActiveRecord::Schema.define(version: 2020_07_27_171227) do

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.float "alcohol"
    t.text "description"
    t.integer "brewer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brewer_id"], name: "index_beers_on_brewer_id"
  end

  create_table "brewers", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "country"
    t.string "webpage_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name"
    t.integer "rating"
    t.text "content"
    t.integer "user_id", null: false
    t.integer "beer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beer_id"], name: "index_reviews_on_beer_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "beers", "brewers"
  add_foreign_key "reviews", "beers"
  add_foreign_key "reviews", "users"
end
