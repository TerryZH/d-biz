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

ActiveRecord::Schema.define(version: 20141205012828) do

  create_table "customers", force: true do |t|
    t.date     "when_joined"
    t.string   "nick"
    t.string   "address"
    t.string   "tel"
    t.string   "email"
    t.string   "wechat"
    t.string   "weibo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materials", force: true do |t|
    t.date     "when"
    t.string   "what"
    t.float    "sum"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orderdetails", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.float    "number"
    t.float    "price"
    t.float    "discount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orderdetails", ["order_id"], name: "index_orderdetails_on_order_id"
  add_index "orderdetails", ["product_id"], name: "index_orderdetails_on_product_id"

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
