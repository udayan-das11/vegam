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

ActiveRecord::Schema.define(version: 20150802071010) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "service_city_mapping_id"
    t.integer  "user_id"
    t.integer  "worker_id"
    t.integer  "sub_service_id"
    t.integer  "locality_id"
    t.string   "email"
    t.string   "phoneno"
    t.string   "name"
    t.string   "address"
    t.integer  "pin"
    t.string   "comments"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "bookings", ["locality_id"], name: "index_bookings_on_locality_id"
  add_index "bookings", ["service_city_mapping_id"], name: "index_bookings_on_service_city_mapping_id"
  add_index "bookings", ["sub_service_id"], name: "index_bookings_on_sub_service_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"
  add_index "bookings", ["worker_id"], name: "index_bookings_on_worker_id"

  create_table "cities", force: :cascade do |t|
    t.string   "cityName"
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

  create_table "item_wh_transacs", force: :cascade do |t|
    t.integer  "warehouse_id"
    t.integer  "item_id"
    t.date     "transac_date"
    t.float    "amount"
    t.string   "transac_type"
    t.integer  "reference_stockout_usage"
    t.string   "responsible_person"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price"
    t.integer  "destination"
    t.string   "note"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.string   "uom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "localities", force: :cascade do |t|
    t.string   "subCity"
    t.string   "rate"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "localities", ["city_id"], name: "index_localities_on_city_id"

  create_table "service_city_mappings", force: :cascade do |t|
    t.integer  "city_id"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_city_mappings", ["city_id"], name: "index_service_city_mappings_on_city_id"
  add_index "service_city_mappings", ["service_id"], name: "index_service_city_mappings_on_service_id"

  create_table "service_locality_mappings", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "city_id"
    t.integer  "locality_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "service_locality_mappings", ["city_id"], name: "index_service_locality_mappings_on_city_id"
  add_index "service_locality_mappings", ["locality_id"], name: "index_service_locality_mappings_on_locality_id"
  add_index "service_locality_mappings", ["service_id"], name: "index_service_locality_mappings_on_service_id"

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sub_services", force: :cascade do |t|
    t.string   "subServiceName"
    t.integer  "service_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "sub_services", ["service_id"], name: "index_sub_services_on_service_id"

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

  create_table "warehouses", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "worker_locality_mappings", force: :cascade do |t|
    t.integer  "worker_id"
    t.integer  "locality_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "worker_locality_mappings", ["locality_id"], name: "index_worker_locality_mappings_on_locality_id"
  add_index "worker_locality_mappings", ["worker_id"], name: "index_worker_locality_mappings_on_worker_id"

  create_table "worker_sl_mappings", force: :cascade do |t|
    t.integer  "worker_id"
    t.integer  "locality_id"
    t.integer  "priority",    default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "worker_sl_mappings", ["locality_id"], name: "index_worker_sl_mappings_on_locality_id"
  add_index "worker_sl_mappings", ["worker_id"], name: "index_worker_sl_mappings_on_worker_id"

  create_table "workers", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "subcity"
    t.string   "peramadd"
    t.string   "phoneno"
    t.string   "email"
    t.integer  "service_id"
    t.string   "contractbasis"
    t.string   "status"
    t.integer  "count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "servicename"
  end

  add_index "workers", ["service_id"], name: "index_workers_on_service_id"

end
