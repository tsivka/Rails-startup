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

ActiveRecord::Schema.define(version: 20161022090715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string  "name"
    t.string  "address"
    t.string  "city"
    t.integer "zip"
    t.integer "district"
    t.integer "region"
    t.string  "country",          default: "Україна"
    t.integer "phone"
    t.string  "logo"
    t.text    "description"
    t.text    "treatments"
    t.integer "business_type_id"
    t.string  "street"
    t.string  "latitude"
    t.string  "longitude"
  end

  add_index "agencies", ["business_type_id"], name: "index_agencies_on_business_type_id", using: :btree

  create_table "business_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "show",       default: true
  end

  create_table "items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "treatment_id"
    t.text     "prices"
    t.decimal  "price_min"
    t.decimal  "discount"
    t.boolean  "show"
    t.integer  "position"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "treatment_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatment_types_treatments", id: false, force: :cascade do |t|
    t.integer "treatment_type_id"
    t.integer "treatment_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.string   "name"
    t.json     "category",   default: {}
    t.boolean  "show",       default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "business_type_id"
    t.integer  "access_level",           default: 0
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.boolean  "is_freelancer",          default: false
    t.integer  "agency_id"
  end

  add_index "users", ["agency_id"], name: "index_users_on_agency_id", using: :btree
  add_index "users", ["business_type_id"], name: "index_users_on_business_type_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "agencies", "business_types"
  add_foreign_key "users", "agencies"
  add_foreign_key "users", "business_types"
end
