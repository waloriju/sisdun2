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

ActiveRecord::Schema.define(version: 20131017083822) do

  create_table "addresses", force: true do |t|
    t.string   "line1",            null: false
    t.string   "line2",            null: false
    t.string   "number",           null: false
    t.string   "postal_code",      null: false
    t.integer  "addressable_id",   null: false
    t.string   "addressable_type", null: false
    t.integer  "city_id",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id"

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "companies", force: true do |t|
    t.string   "company_name", null: false
    t.string   "trading_name", null: false
    t.string   "cnpj",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["cnpj"], name: "index_companies_on_cnpj", unique: true

  create_table "contacts", force: true do |t|
    t.string   "phone1",           null: false
    t.string   "phone2"
    t.string   "phone3"
    t.string   "email"
    t.integer  "contactable_id",   null: false
    t.string   "contactable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "gender",     null: false
    t.string   "cpf",        null: false
    t.date     "birth_date", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["cpf"], name: "index_customers_on_cpf", unique: true

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id"
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id"

  create_table "products", force: true do |t|
    t.string   "title",                               null: false
    t.text     "description"
    t.string   "sale_type"
    t.decimal  "price",       precision: 8, scale: 2
    t.integer  "stock"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"

  create_table "states", force: true do |t|
    t.string   "abbreviation"
    t.string   "name"
    t.integer  "capital_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["capital_id"], name: "index_states_on_capital_id"

  create_table "users", force: true do |t|
    t.string   "name",                            null: false
    t.string   "email",                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
