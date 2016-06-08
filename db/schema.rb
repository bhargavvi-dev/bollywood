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

ActiveRecord::Schema.define(version: 20160607070954) do

  create_table "artist_users", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "user_id"
    t.boolean  "is_admin",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "artist_users", ["artist_id"], name: "index_artist_users_on_artist_id"
  add_index "artist_users", ["user_id"], name: "index_artist_users_on_user_id"

  create_table "artists", force: :cascade do |t|
    t.string   "real_name"
    t.string   "nick_name"
    t.text     "address"
    t.date     "dob"
    t.string   "hometown"
    t.string   "religion"
    t.string   "nationality"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "content_item_resources", force: :cascade do |t|
    t.integer  "content_item_id"
    t.integer  "content_resource_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "content_item_resources", ["content_item_id"], name: "index_content_item_resources_on_content_item_id"
  add_index "content_item_resources", ["content_resource_id"], name: "index_content_item_resources_on_content_resource_id"

  create_table "content_items", force: :cascade do |t|
    t.integer  "data_item_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "content_items", ["data_item_id"], name: "index_content_items_on_data_item_id"

  create_table "content_resources", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_items", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "type"
    t.string   "title"
    t.boolean  "is_active",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "data_items", ["artist_id"], name: "index_data_items_on_artist_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
