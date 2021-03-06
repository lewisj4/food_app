# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150507154603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string   "name",          null: false
    t.integer  "calories"
    t.integer  "fat_calories"
    t.integer  "carbohydrates"
    t.integer  "fats"
    t.integer  "protein"
    t.integer  "meal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods_meals", id: false, force: :cascade do |t|
    t.integer "meal_id", null: false
    t.integer "food_id", null: false
  end

  add_index "foods_meals", ["food_id"], name: "index_foods_meals_on_food_id", using: :btree
  add_index "foods_meals", ["meal_id"], name: "index_foods_meals_on_meal_id", using: :btree

  create_table "meals", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username",        null: false
    t.string "password_digest"
    t.string "full_name",       null: false
  end

end
