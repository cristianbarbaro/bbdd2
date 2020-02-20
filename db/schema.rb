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

ActiveRecord::Schema.define(version: 2020_02_20_202027) do

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
    t.string "name"
    t.string "scientific_name"
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "composition"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "varieties", force: :cascade do |t|
    t.string "name"
    t.string "scientific_name"
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "crops", "plots"
  add_foreign_key "crops", "varieties"
  add_foreign_key "plantations", "plots"
  add_foreign_key "plantations", "species"
  add_foreign_key "plots", "farms"
end
