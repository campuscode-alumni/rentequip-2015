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

ActiveRecord::Schema.define(version: 20151026232212) do

  create_table "bills", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "contract_id"
    t.integer  "number"
  end

  add_index "bills", ["contract_id"], name: "index_bills_on_contract_id"

  create_table "contracts", force: :cascade do |t|
    t.string   "equipment"
    t.string   "payment_method"
    t.string   "delivery_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "customer_id"
    t.integer  "rental_period_id"
  end

  add_index "contracts", ["customer_id"], name: "index_contracts_on_customer_id"
  add_index "contracts", ["rental_period_id"], name: "index_contracts_on_rental_period_id"

  create_table "contracts_equipment", force: :cascade do |t|
    t.integer "equipment_id"
    t.integer "contract_id"
  end

  add_index "contracts_equipment", ["contract_id"], name: "index_contracts_equipment_on_contract_id"
  add_index "contracts_equipment", ["equipment_id"], name: "index_contracts_equipment_on_equipment_id"

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
    t.string   "phone"
    t.string   "cell"
    t.string   "rg"
    t.string   "email"
    t.string   "birthdate"
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "supplier"
    t.float    "price"
    t.integer  "asset_number"
    t.date     "purchased_at"
    t.float    "acquisition_price"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "equipment_category_id"
  end

  add_index "equipment", ["equipment_category_id"], name: "index_equipment_on_equipment_category_id"

  create_table "equipment_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "mark"
  end

  create_table "prices", force: :cascade do |t|
    t.string   "time"
    t.float    "total"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "rental_period_id"
    t.integer  "equipment_category_id"
  end

  add_index "prices", ["equipment_category_id"], name: "index_prices_on_equipment_category_id"
  add_index "prices", ["rental_period_id"], name: "index_prices_on_rental_period_id"

  create_table "rental_periods", force: :cascade do |t|
    t.string   "description"
    t.integer  "period"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "cnpj"
    t.string   "account_manager"
    t.string   "company_name"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.string   "municipal_registration"
    t.string   "state_registration"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
