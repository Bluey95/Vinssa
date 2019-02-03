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

ActiveRecord::Schema.define(version: 2019_03_09_103947) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "drugs" because of following StandardError
#   Unknown type 'string' for column 'supplier'

  create_table "invoicing_ledger_items", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.string "type"
    t.datetime "issue_date"
    t.string "currency", limit: 3, null: false
    t.decimal "total_amount", precision: 20, scale: 4
    t.decimal "tax_amount", precision: 20, scale: 4
    t.string "status", limit: 20
    t.string "identifier", limit: 50
    t.string "description"
    t.datetime "period_start"
    t.datetime "period_end"
    t.string "uuid", limit: 40
    t.datetime "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_invoicing_ledger_items_on_recipient_id"
    t.index ["sender_id"], name: "index_invoicing_ledger_items_on_sender_id"
  end

  create_table "invoicing_line_items", force: :cascade do |t|
    t.integer "ledger_item_id"
    t.string "type"
    t.decimal "net_amount", precision: 20, scale: 4
    t.decimal "tax_amount", precision: 20, scale: 4
    t.string "description"
    t.string "uuid", limit: 40
    t.datetime "tax_point"
    t.decimal "quantity", precision: 20, scale: 4
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ledger_item_id"], name: "index_invoicing_line_items_on_ledger_item_id"
  end

  create_table "invoicing_tax_rates", force: :cascade do |t|
    t.string "description"
    t.decimal "rate", precision: 20, scale: 4
    t.datetime "valid_from", null: false
    t.datetime "valid_until"
    t.integer "replaced_by_id"
    t.boolean "is_default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "drug_id"
    t.integer "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.integer "order_id"
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["drug_id"], name: "index_line_items_on_drug_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "email"
    t.integer "pay_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.boolean "admin"
    t.boolean "supplier"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
