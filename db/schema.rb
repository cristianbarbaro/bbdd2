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

ActiveRecord::Schema.define(version: 2020_02_28_112903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crops", force: :cascade do |t|
    t.text "comment"
    t.float "amount"
    t.bigint "variety_id"
    t.bigint "plot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plot_id"], name: "index_crops_on_plot_id"
    t.index ["variety_id"], name: "index_crops_on_variety_id"
  end

  create_table "farms", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "farms_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "farm_id", null: false
  end

  create_table "plantations", force: :cascade do |t|
    t.text "comment"
    t.integer "amount", null: false
    t.bigint "species_id"
    t.bigint "plot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plot_id"], name: "index_plantations_on_plot_id"
    t.index ["species_id"], name: "index_plantations_on_species_id"
  end

  create_table "plot_problems", force: :cascade do |t|
    t.text "comment"
    t.bigint "problem_id"
    t.bigint "plot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plot_id"], name: "index_plot_problems_on_plot_id"
    t.index ["problem_id"], name: "index_plot_problems_on_problem_id"
  end

  create_table "plots", force: :cascade do |t|
    t.string "identifier", null: false
    t.float "surface", null: false
    t.boolean "greenhouse", null: false
    t.text "description"
    t.bigint "farm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farm_id"], name: "index_plots_on_farm_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "name", null: false
    t.string "scientific_name", null: false
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_applications", force: :cascade do |t|
    t.float "amount", null: false
    t.text "comment"
    t.bigint "product_id"
    t.bigint "plot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plot_id"], name: "index_product_applications_on_plot_id"
    t.index ["product_id"], name: "index_product_applications_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.text "composition", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "varieties", force: :cascade do |t|
    t.string "name", null: false
    t.string "scientific_name", null: false
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "crops", "plots"
  add_foreign_key "crops", "varieties"
  add_foreign_key "plantations", "plots"
  add_foreign_key "plantations", "species"
  add_foreign_key "plot_problems", "plots"
  add_foreign_key "plot_problems", "problems"
  add_foreign_key "plots", "farms"
  add_foreign_key "product_applications", "plots"
  add_foreign_key "product_applications", "products"
end
