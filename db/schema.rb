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

ActiveRecord::Schema.define(version: 20160415035551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string  "title"
    t.integer "goal_id"
  end

  create_table "charities", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "bank_name"
    t.integer  "bank_bsb"
    t.integer  "bank_acc"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "achieved",     default: false
    t.integer  "order_id"
    t.integer  "initiator_id"
    t.integer  "acceptor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "amount"
    t.boolean  "user_paid"
    t.boolean  "user_refunded"
    t.boolean  "vault_paid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subgoals", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.string   "image_url"
    t.string   "password_digest"
    t.text     "bio"
    t.string   "country"
    t.string   "city"
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
