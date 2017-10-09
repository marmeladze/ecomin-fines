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

ActiveRecord::Schema.define(version: 20171008130543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classifications", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "compenstation_rates", force: :cascade do |t|
    t.integer  "classification_id"
    t.integer  "tree_id"
    t.decimal  "large_price",       precision: 5, scale: 2, default: 0.0
    t.decimal  "mid_price",         precision: 5, scale: 2, default: 0.0
    t.decimal  "small_price",       precision: 5, scale: 2, default: 0.0
    t.decimal  "combustible_price", precision: 5, scale: 2, default: 0.0
    t.decimal  "garbage_price",     precision: 5, scale: 2, default: 0.0
    t.decimal  "umbrella_price",    precision: 5, scale: 2, default: 0.0
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "compenstation_rates", ["classification_id"], name: "index_compenstation_rates_on_classification_id", using: :btree
  add_index "compenstation_rates", ["tree_id"], name: "index_compenstation_rates_on_tree_id", using: :btree

  create_table "detours", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "forestry_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "detours", ["forestry_id"], name: "index_detours_on_forestry_id", using: :btree

  create_table "forestries", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "region_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "forestries", ["region_id"], name: "index_forestries_on_region_id", using: :btree

  create_table "height_ranges", force: :cascade do |t|
    t.integer  "classification_id"
    t.integer  "tree_id"
    t.numrange "h_range"
    t.integer  "diameter"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "height_ranges", ["classification_id"], name: "index_height_ranges_on_classification_id", using: :btree
  add_index "height_ranges", ["tree_id"], name: "index_height_ranges_on_tree_id", using: :btree

  create_table "material_volumes", force: :cascade do |t|
    t.integer  "classification_id"
    t.integer  "tree_id"
    t.integer  "diameter"
    t.decimal  "large",             precision: 5, scale: 3, default: 0.0
    t.decimal  "mid",               precision: 5, scale: 3, default: 0.0
    t.decimal  "small",             precision: 5, scale: 3, default: 0.0
    t.decimal  "combustible",       precision: 5, scale: 3, default: 0.0
    t.decimal  "garbage",           precision: 5, scale: 3, default: 0.0
    t.decimal  "umbrella",          precision: 5, scale: 3, default: 0.0
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "material_volumes", ["classification_id"], name: "index_material_volumes_on_classification_id", using: :btree
  add_index "material_volumes", ["tree_id"], name: "index_material_volumes_on_tree_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "trees", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "compenstation_rates", "classifications"
  add_foreign_key "compenstation_rates", "trees"
  add_foreign_key "detours", "forestries"
  add_foreign_key "forestries", "regions"
  add_foreign_key "height_ranges", "classifications"
  add_foreign_key "height_ranges", "trees"
  add_foreign_key "material_volumes", "classifications"
  add_foreign_key "material_volumes", "trees"
end
