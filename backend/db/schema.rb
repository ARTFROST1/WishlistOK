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

ActiveRecord::Schema[8.0].define(version: 2025_11_17_000001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "claims", force: :cascade do |t|
    t.bigint "wish_id", null: false
    t.bigint "user_id", null: false
    t.integer "status", default: 0, null: false
    t.text "note"
    t.decimal "contribution_amount", precision: 10, scale: 2
    t.string "currency", limit: 3, default: "USD"
    t.json "metadata", default: {}
    t.datetime "purchased_at"
    t.boolean "is_surprise", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_claims_on_created_at"
    t.index ["purchased_at"], name: "index_claims_on_purchased_at"
    t.index ["status"], name: "index_claims_on_status"
    t.index ["user_id"], name: "index_claims_on_user_id"
    t.index ["wish_id", "user_id"], name: "index_claims_on_wish_id_and_user_id", unique: true
    t.index ["wish_id"], name: "index_claims_on_wish_id"
  end

  create_table "guests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "identifier", limit: 255, null: false
    t.string "session_token", limit: 255
    t.inet "ip_address"
    t.string "user_agent", limit: 500
    t.json "metadata", default: {}
    t.datetime "last_activity_at"
    t.boolean "converted_to_regular", default: false, null: false
    t.datetime "converted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["converted_to_regular"], name: "index_guests_on_converted_to_regular"
    t.index ["identifier"], name: "index_guests_on_identifier", unique: true
    t.index ["last_activity_at"], name: "index_guests_on_last_activity_at"
    t.index ["session_token"], name: "index_guests_on_session_token", unique: true
    t.index ["user_id"], name: "index_guests_on_user_id", unique: true
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exp"], name: "index_jwt_denylist_on_exp"
    t.index ["jti"], name: "index_jwt_denylist_on_jti", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "claim_id", null: false
    t.bigint "user_id", null: false
    t.bigint "wish_id", null: false
    t.string "provider", default: "yookassa", null: false
    t.string "provider_payment_id", null: false
    t.string "payment_method"
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.string "currency", default: "RUB", null: false
    t.decimal "fee", precision: 10, scale: 2
    t.integer "status", default: 0, null: false
    t.string "description"
    t.jsonb "metadata", default: {}
    t.jsonb "provider_response", default: {}
    t.string "confirmation_url"
    t.string "receipt_url"
    t.datetime "confirmed_at"
    t.datetime "failed_at"
    t.datetime "refunded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["claim_id"], name: "index_payments_on_claim_id"
    t.index ["created_at"], name: "index_payments_on_created_at"
    t.index ["provider_payment_id"], name: "index_payments_on_provider_payment_id", unique: true
    t.index ["status"], name: "index_payments_on_status"
    t.index ["user_id", "created_at"], name: "index_payments_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_payments_on_user_id"
    t.index ["wish_id", "status"], name: "index_payments_on_wish_id_and_status"
    t.index ["wish_id"], name: "index_payments_on_wish_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "user_type", default: 0, null: false
    t.boolean "active", default: true, null: false
    t.text "bio"
    t.string "avatar_url"
    t.json "preferences", default: {}
    t.datetime "last_active_at"
    t.inet "last_ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_users_on_active"
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_type"], name: "index_users_on_user_type"
  end

  create_table "wishes", force: :cascade do |t|
    t.bigint "wishlist_id", null: false
    t.string "title", limit: 255, null: false
    t.text "description"
    t.text "url"
    t.string "image_url", limit: 500
    t.decimal "price", precision: 10, scale: 2
    t.string "currency", limit: 3, default: "USD"
    t.text "note"
    t.integer "status", default: 0, null: false
    t.integer "priority", default: 1, null: false
    t.json "metadata", default: {}
    t.boolean "active", default: true, null: false
    t.string "brand", limit: 100
    t.string "category", limit: 100
    t.json "images", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_wishes_on_active"
    t.index ["category"], name: "index_wishes_on_category"
    t.index ["created_at"], name: "index_wishes_on_created_at"
    t.index ["priority"], name: "index_wishes_on_priority"
    t.index ["status"], name: "index_wishes_on_status"
    t.index ["wishlist_id"], name: "index_wishes_on_wishlist_id"
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", limit: 255, null: false
    t.text "description"
    t.date "event_date"
    t.string "slug", limit: 255, null: false
    t.integer "visibility", default: 1, null: false
    t.string "theme_color", limit: 7
    t.json "metadata", default: {}
    t.boolean "active", default: true, null: false
    t.integer "wishes_count", default: 0, null: false
    t.integer "claimed_wishes_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_wishlists_on_active"
    t.index ["created_at"], name: "index_wishlists_on_created_at"
    t.index ["event_date"], name: "index_wishlists_on_event_date"
    t.index ["slug"], name: "index_wishlists_on_slug", unique: true
    t.index ["user_id"], name: "index_wishlists_on_user_id"
    t.index ["visibility"], name: "index_wishlists_on_visibility"
  end

  add_foreign_key "claims", "users"
  add_foreign_key "claims", "wishes"
  add_foreign_key "guests", "users"
  add_foreign_key "payments", "claims"
  add_foreign_key "payments", "users"
  add_foreign_key "payments", "wishes"
  add_foreign_key "wishes", "wishlists"
  add_foreign_key "wishlists", "users"
end
