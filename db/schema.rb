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

ActiveRecord::Schema.define(version: 20140316085032) do

  create_table "assets", force: true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer  "sm_content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genmenus", force: true do |t|
    t.string   "genmenuname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sm_contents", force: true do |t|
    t.text     "content"
    t.integer  "submenu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "submenus", force: true do |t|
    t.string   "sname"
    t.integer  "genmenu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submenus", ["genmenu_id", "created_at"], name: "index_submenus_on_genmenu_id_and_created_at", using: :btree

end
