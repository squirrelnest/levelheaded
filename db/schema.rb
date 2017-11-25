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

ActiveRecord::Schema.define(version: 20171123022605) do

  create_table "chowtables", force: :cascade do |t|
    t.integer "number"
    t.string  "table_type"
    t.integer "restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string  "name"
    t.integer "phone",          limit: 8
    t.string  "street_address"
    t.string  "city"
    t.string  "state"
    t.string  "zipcode"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "wobble"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.integer  "chowtable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "password"
    t.integer "restaurant_id"
  end

end
