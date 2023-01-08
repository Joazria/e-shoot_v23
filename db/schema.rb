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

ActiveRecord::Schema.define(version: 2022_12_27_160718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addons", force: :cascade do |t|
    t.string "addon_name"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_addons_on_product_id"
  end

  create_table "angles", force: :cascade do |t|
    t.string "angle_name"
    t.text "description"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_angles_on_category_id"
  end

  create_table "backgrounds", force: :cascade do |t|
    t.string "bg_color"
    t.string "bg_name"
    t.text "description"
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_backgrounds_on_category_id"
  end

  create_table "briefings", force: :cascade do |t|
    t.text "release"
    t.string "ref1"
    t.string "ref2"
    t.bigint "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_briefings_on_order_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.date "deadline"
    t.string "period"
    t.string "manequin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "instudio_id"
    t.index ["instudio_id"], name: "index_calendars_on_instudio_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "company"
    t.string "cnpj"
    t.bigint "user_id", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "last_name"
    t.string "first_name"
    t.string "whatsapp"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.date "delivery_date"
    t.string "delivery_link"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "step"
    t.index ["order_id"], name: "index_deliveries_on_order_id"
  end

  create_table "instudios", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "moodboard_id"
    t.bigint "addon_id"
    t.bigint "user_id"
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addon_id"], name: "index_instudios_on_addon_id"
    t.index ["client_id"], name: "index_instudios_on_client_id"
    t.index ["moodboard_id"], name: "index_instudios_on_moodboard_id"
    t.index ["product_id"], name: "index_instudios_on_product_id"
    t.index ["user_id"], name: "index_instudios_on_user_id"
  end

  create_table "moodboards", force: :cascade do |t|
    t.string "moodboard_name"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_moodboards_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "amounts"
    t.string "ref1"
    t.string "ref2"
    t.string "bg_color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "angle_id"
    t.bigint "category_id"
    t.bigint "size_id"
    t.bigint "background_id"
    t.string "step"
    t.string "delivery_url"
    t.date "delivery_date"
    t.text "release"
    t.index ["angle_id"], name: "index_orders_on_angle_id"
    t.index ["background_id"], name: "index_orders_on_background_id"
    t.index ["category_id"], name: "index_orders_on_category_id"
    t.index ["size_id"], name: "index_orders_on_size_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.string "category_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string "size_name"
    t.text "description"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_sizes_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addons", "products"
  add_foreign_key "angles", "categories"
  add_foreign_key "backgrounds", "categories"
  add_foreign_key "briefings", "orders"
  add_foreign_key "calendars", "instudios"
  add_foreign_key "clients", "users"
  add_foreign_key "deliveries", "orders"
  add_foreign_key "instudios", "addons"
  add_foreign_key "instudios", "clients"
  add_foreign_key "instudios", "moodboards"
  add_foreign_key "instudios", "products"
  add_foreign_key "instudios", "users"
  add_foreign_key "moodboards", "products"
  add_foreign_key "orders", "angles"
  add_foreign_key "orders", "backgrounds"
  add_foreign_key "orders", "categories"
  add_foreign_key "orders", "sizes"
  add_foreign_key "orders", "users"
  add_foreign_key "sizes", "categories"
end
