# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_22_114549) do

  create_table "pattern1_children", force: :cascade do |t|
    t.string "title"
    t.integer "pattern1_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pattern1_id"], name: "index_pattern1_children_on_pattern1_id"
  end

  create_table "pattern1s", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pattern2_children", force: :cascade do |t|
    t.string "title"
    t.integer "pattern2_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pattern2_id"], name: "index_pattern2_children_on_pattern2_id"
  end

  create_table "pattern2s", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pattern3_children", force: :cascade do |t|
    t.string "title"
    t.integer "pattern3_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pattern3_id"], name: "index_pattern3_children_on_pattern3_id"
  end

  create_table "pattern3s", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pattern4_children", force: :cascade do |t|
    t.string "title"
    t.integer "pattern4_id", null: false
    t.index ["pattern4_id"], name: "index_pattern4_children_on_pattern4_id"
  end

  create_table "pattern4s", force: :cascade do |t|
    t.string "title"
  end

  create_table "pattern5_children", force: :cascade do |t|
    t.string "title"
    t.integer "pattern5_id", null: false
    t.index ["pattern5_id"], name: "index_pattern5_children_on_pattern5_id"
  end

  create_table "pattern5s", force: :cascade do |t|
    t.string "title"
  end

  add_foreign_key "pattern2_children", "pattern2s"
  add_foreign_key "pattern3_children", "pattern3s"
  add_foreign_key "pattern4_children", "pattern4s"
  add_foreign_key "pattern5_children", "pattern5s"
end
