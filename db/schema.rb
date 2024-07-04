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

ActiveRecord::Schema[7.0].define(version: 2024_07_04_205738) do
  create_table "bank_accounts", force: :cascade do |t|
    t.decimal "valor_total"
    t.string "numero_conta"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "from_account_id", null: false
    t.integer "to_account_id", null: false
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_account_id"], name: "index_transactions_on_from_account_id"
    t.index ["to_account_id"], name: "index_transactions_on_to_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome_completo"
    t.string "email"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bank_accounts", "users"
  add_foreign_key "transactions", "bank_accounts", column: "from_account_id"
  add_foreign_key "transactions", "bank_accounts", column: "to_account_id"
end
