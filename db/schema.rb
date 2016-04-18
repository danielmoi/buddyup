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

ActiveRecord::Schema.define(version: 20160418100510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_goals", id: false, force: :cascade do |t|
    t.integer "goal_id"
    t.integer "category_id"
  end

  add_index "categories_goals", ["category_id"], name: "index_categories_goals_on_category_id", using: :btree
  add_index "categories_goals", ["goal_id"], name: "index_categories_goals_on_goal_id", using: :btree

  create_table "goals", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "achieved",     default: false
    t.integer  "acceptor_id"
    t.integer  "initiator_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "amount"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "initiator_id"
    t.integer  "acceptor_id"
    t.text     "subject"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "goal_id"
  end

  add_index "messages", ["goal_id"], name: "index_messages_on_goal_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "amount"
    t.boolean  "user_paid",     default: false
    t.boolean  "user_refunded", default: false
    t.boolean  "vault_paid",    default: false
    t.integer  "goal_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "orders", ["goal_id"], name: "index_orders_on_goal_id", using: :btree

  create_table "subgoals", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "completed",   default: false
    t.integer  "goal_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "subgoals", ["goal_id"], name: "index_subgoals_on_goal_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.string   "image_url"
    t.string   "password_digest"
    t.text     "bio"
    t.string   "country"
    t.string   "city"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_foreign_key "messages", "goals"
end
