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

ActiveRecord::Schema.define(version: 20150714070738) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contractors", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "subarea"
    t.string   "permaddr"
    t.integer  "phoneno"
    t.string   "email"
    t.string   "service"
    t.string   "contarctbasis"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "localities", force: :cascade do |t|
    t.string   "name"
    t.string   "rate"
    t.integer  "city_id"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "localities", ["city_id"], name: "index_localities_on_city_id"
  add_index "localities", ["service_id"], name: "index_localities_on_service_id"

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "password"
    t.string   "confirm_password"
    t.string   "phone"
    t.string   "email"
    t.string   "gender"
    t.string   "dob"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
