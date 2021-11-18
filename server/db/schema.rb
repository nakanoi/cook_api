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

ActiveRecord::Schema.define(version: 2021_11_18_133536) do

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.integer "category_id", null: false
    t.string "url", null: false
    t.string "query", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id", "url", "query"], name: "ingredient_index", unique: true
  end

  create_table "crono_jobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "job_id", null: false
    t.text "log", size: :long
    t.datetime "last_performed_at"
    t.boolean "healthy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true
  end

  create_table "foods", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.integer "store", null: false
    t.string "unit", null: false
    t.string "token", null: false
    t.boolean "ignore", default: true, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token"], name: "index_foods_on_token", unique: true
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "histories", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "menu_id", null: false
    t.string "food", null: false
    t.date "day", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_id"], name: "index_histories_on_menu_id"
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "ingredients", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.string "name", null: false
    t.string "menu_id_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_id"], name: "index_ingredients_on_menu_id"
    t.index ["menu_id_name"], name: "index_ingredients_on_menu_id_name", unique: true
  end

  create_table "menus", primary_key: "menu_id", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "img", null: false
    t.string "medium_img", null: false
    t.string "small_img", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.string "url", null: false
    t.string "poster", null: false
    t.string "indication", null: false
    t.string "cost", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_id", "url"], name: "menu_index", unique: true
  end

  create_table "sessions", charset: "utf8mb4", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name", null: false
    t.string "email", null: false
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "foods", "users"
  add_foreign_key "histories", "menus", primary_key: "menu_id"
  add_foreign_key "histories", "users"
  add_foreign_key "ingredients", "menus", primary_key: "menu_id"
end
