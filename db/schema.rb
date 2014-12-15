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

ActiveRecord::Schema.define(version: 20141212020018) do

  create_table "addresses", force: true do |t|
    t.string   "region"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.date     "when_joined"
    t.string   "nick"
    t.string   "tel"
    t.string   "email"
    t.string   "wechat"
    t.string   "weibo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliveries", force: true do |t|
    t.integer  "who_id"
    t.datetime "start"
    t.datetime "milestone0"
    t.datetime "milestone1"
    t.datetime "milestone2"
    t.datetime "milestone3"
    t.datetime "milestone4"
    t.datetime "milestone5"
    t.datetime "milestone6"
    t.datetime "milestone7"
    t.datetime "milestone8"
    t.datetime "milestone9"
    t.datetime "end"
    t.integer  "bill_to_id"
    t.integer  "ship_to_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deliveries", ["bill_to_id"], name: "index_deliveries_on_bill_to_id"
  add_index "deliveries", ["ship_to_id"], name: "index_deliveries_on_ship_to_id"
  add_index "deliveries", ["who_id"], name: "index_deliveries_on_who_id"

  create_table "items", force: true do |t|
    t.integer  "order_id"
    t.integer  "delivery_id"
    t.integer  "product_id"
    t.float    "number"
    t.float    "price"
    t.float    "cost"
    t.float    "discount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["delivery_id"], name: "index_items_on_delivery_id"
  add_index "items", ["order_id"], name: "index_items_on_order_id"
  add_index "items", ["product_id"], name: "index_items_on_product_id"

  create_table "materials", force: true do |t|
    t.date     "when"
    t.string   "what"
    t.float    "sum"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.date     "when"
    t.integer  "who_id"
    t.float    "sum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["who_id"], name: "index_orders_on_who_id"

  create_table "productions", force: true do |t|
    t.date     "when"
    t.integer  "who_id"
    t.integer  "what_id"
    t.float    "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "productions", ["what_id"], name: "index_productions_on_what_id"
  add_index "productions", ["who_id"], name: "index_productions_on_who_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "cost"
    t.float    "price"
  end

  create_table "profits", force: true do |t|
    t.float    "profit"
    t.float    "amount"
    t.date     "when"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promotions", force: true do |t|
    t.date     "when"
    t.string   "what"
    t.float    "sum"
    t.float    "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
