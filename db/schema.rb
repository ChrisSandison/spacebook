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

ActiveRecord::Schema.define(version: 20140322210438) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "content"
    t.datetime "takes_place_at"
    t.integer  "space_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["space_id"], name: "index_events_on_space_id"

  create_table "regions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
    t.text     "name"
    t.text     "region_code"
  end

  create_table "reviews", force: true do |t|
    t.integer  "space_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "created_by_name"
    t.integer  "user_id"
    t.integer  "rating"
    t.integer  "event_id"
    t.text     "atmosphere"
    t.string   "accessibility"
    t.string   "event_other"
    t.boolean  "would_attend"
    t.boolean  "would_book"
  end

  add_index "reviews", ["space_id"], name: "index_reviews_on_space_id"

  create_table "spaces", force: true do |t|
    t.string   "name"
    t.string   "contact_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_email"
    t.string   "contact_number"
    t.text     "content"
    t.integer  "created_by_user"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "website"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
