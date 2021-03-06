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

ActiveRecord::Schema.define(version: 20140311190224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_items", force: true do |t|
    t.string   "item_name"
    t.text     "item_desc"
    t.decimal  "price",      precision: 9, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "check_id"
    t.integer  "quantity"
  end

  create_table "checks", force: true do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "paid_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tip"
    t.decimal  "total",         precision: 9, scale: 2
  end

  create_table "menu_items", force: true do |t|
    t.integer  "restaurant_id"
    t.string   "item_name"
    t.text     "item_desc"
    t.decimal  "price",         precision: 9, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.text     "description"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                            null: false
    t.string   "crypted_password",                 null: false
    t.string   "salt",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "checked_in",       default: false
    t.integer  "tip",              default: 15
    t.boolean  "admin",            default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
