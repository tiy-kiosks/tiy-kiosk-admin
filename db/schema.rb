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

ActiveRecord::Schema.define(version: 20160412182451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kiosks", force: :cascade do |t|
    t.string   "name"
    t.string   "background_photo_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "slides", force: :cascade do |t|
    t.integer  "kiosk_id"
    t.integer  "order_number",     default: 99
    t.date     "start_date"
    t.date     "end_date"
    t.string   "pattern",          default: "markdown"
    t.string   "markdown_content"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "slides", ["kiosk_id"], name: "index_slides_on_kiosk_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "slides", "kiosks"
end
