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

ActiveRecord::Schema.define(version: 2021_11_17_190718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "produtos", force: :cascade do |t|
    t.string "name"
    t.string "descricao"
    t.integer "quantidade"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_produtos_on_user_id"
  end

  create_table "trocas", force: :cascade do |t|
    t.integer "solicitante_id"
    t.integer "solicitado_id"
    t.bigint "produto_id"
    t.boolean "aceite_solicitante", default: false
    t.boolean "aceite_solicitado", default: false
    t.boolean "troca_finalizada", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["produto_id"], name: "index_trocas_on_produto_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
