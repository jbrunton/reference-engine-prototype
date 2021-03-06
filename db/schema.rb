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

ActiveRecord::Schema.define(version: 20150524134812) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id"

  create_table "categories_facts", id: false, force: :cascade do |t|
    t.integer "fact_id",     null: false
    t.integer "category_id", null: false
  end

  create_table "facts", force: :cascade do |t|
    t.text     "summary"
    t.text     "content"
    t.string   "references_string"
    t.string   "categories_string"
    t.string   "version_description"
    t.integer  "version_number"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "facts_references", id: false, force: :cascade do |t|
    t.integer "fact_id",      null: false
    t.integer "reference_id", null: false
  end

  create_table "references", force: :cascade do |t|
    t.string   "key"
    t.string   "title"
    t.string   "author"
    t.string   "url"
    t.string   "summary"
    t.string   "version_description"
    t.integer  "version_number"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
