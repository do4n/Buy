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

ActiveRecord::Schema[7.0].define(version: 2022_08_24_154324) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_variants", force: :cascade do |t|
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "variant_id"
    t.index ["product_id"], name: "index_product_variants_on_product_id"
    t.index ["variant_id"], name: "index_product_variants_on_variant_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "type"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "type"
  end

  create_table "property_value_floats", force: :cascade do |t|
    t.integer "property_id", null: false
    t.integer "product_id", null: false
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_property_value_floats_on_product_id"
    t.index ["property_id"], name: "index_property_value_floats_on_property_id"
  end

  create_table "property_value_strings", force: :cascade do |t|
    t.integer "property_id", null: false
    t.integer "product_id", null: false
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_property_value_strings_on_product_id"
    t.index ["property_id"], name: "index_property_value_strings_on_property_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "sub_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
    t.index ["sub_category_id"], name: "index_sub_categories_on_sub_category_id"
  end

  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "property_value_floats", "products"
  add_foreign_key "property_value_floats", "properties"
  add_foreign_key "property_value_strings", "products"
  add_foreign_key "property_value_strings", "properties"
  add_foreign_key "sub_categories", "categories"
end
