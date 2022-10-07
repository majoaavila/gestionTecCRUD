# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_07_071749) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "Name"
    t.string "LastName"
    t.string "Sex"
    t.date "birthDate"
    t.string "email"
    t.bigint "phone"
    t.string "state"
    t.string "city"
    t.string "colony"
    t.string "street"
    t.string "houseNumber"
    t.bigint "cp"
    t.bigint "puntos"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "sex"
    t.string "position"
    t.string "shift"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "salary"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "bar_code"
    t.string "name"
    t.string "category"
    t.string "batch"
    t.date "exp_date"
    t.bigint "buying_price"
    t.bigint "selling_price"
    t.integer "units"
    t.bigint "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.date "arrive_date"
    t.string "rfc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "products", "suppliers"
end
