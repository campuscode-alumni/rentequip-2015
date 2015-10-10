ActiveRecord::Schema.define(version: 20151008235533) do

  create_table "contracts", force: :cascade do |t|
    t.string   "customer"
    t.string   "equipment"
    t.string   "time"
    t.string   "payment_method"
    t.string   "devolution_date"
    t.string   "delivery_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

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
    t.string   "name"
    t.string   "mark"
    t.string   "supplier"
    t.float    "price"
    t.string   "model"
    t.integer  "asset_number"
    t.date     "purchased_at"
    t.float    "acquisition_price"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "prices", force: :cascade do |t|
    t.string   "time"
    t.decimal  "total"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "equipment_id"
  end

  add_index "prices", ["equipment_id"], name: "index_prices_on_equipment_id"

end
