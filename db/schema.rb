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

ActiveRecord::Schema.define(version: 20150915151544) do

  create_table "customers", force: :cascade do |t|
    t.string   "first_name", limit: 255,   null: false
    t.string   "last_name",  limit: 255
    t.binary   "photo",      limit: 65535
    t.string   "reference",  limit: 255
    t.string   "mobile",     limit: 255,   null: false
    t.string   "email",      limit: 255,   null: false
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "customers_groups", id: false, force: :cascade do |t|
    t.integer "customer_id", limit: 4
    t.integer "group_id",    limit: 4
  end

  add_index "customers_groups", ["customer_id"], name: "index_customers_groups_on_customer_id", using: :btree
  add_index "customers_groups", ["group_id"], name: "index_customers_groups_on_group_id", using: :btree

  create_table "customers_identities", id: false, force: :cascade do |t|
    t.integer "customer_id", limit: 4
    t.integer "identity_id", limit: 4
  end

  add_index "customers_identities", ["customer_id"], name: "index_customers_identities_on_customer_id", using: :btree
  add_index "customers_identities", ["identity_id"], name: "index_customers_identities_on_identity_id", using: :btree

  create_table "customers_pricings", id: false, force: :cascade do |t|
    t.integer "customer_id", limit: 4
    t.integer "pricing_id",  limit: 4
  end

  add_index "customers_pricings", ["customer_id"], name: "index_customers_pricings_on_customer_id", using: :btree
  add_index "customers_pricings", ["pricing_id"], name: "index_customers_pricings_on_pricing_id", using: :btree

  create_table "customers_products", id: false, force: :cascade do |t|
    t.integer "customer_id", limit: 4
    t.integer "product_id",  limit: 4
  end

  add_index "customers_products", ["customer_id"], name: "index_customers_products_on_customer_id", using: :btree
  add_index "customers_products", ["product_id"], name: "index_customers_products_on_product_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "package_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "identities", force: :cascade do |t|
    t.string   "name",                  limit: 255,   null: false
    t.text     "comments",              limit: 65535
    t.integer  "customer_id",           limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
  end

  add_index "identities", ["customer_id"], name: "index_identities_on_customer_id", using: :btree

  create_table "packages", force: :cascade do |t|
    t.string   "name",       limit: 255,   null: false
    t.text     "notes",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pricing_names", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "currency",   limit: 255
    t.integer  "pricing_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pricings", force: :cascade do |t|
    t.integer  "cost_price", limit: 4, null: false
    t.integer  "package_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "package_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name",       limit: 255,   null: false
    t.text     "comment",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
