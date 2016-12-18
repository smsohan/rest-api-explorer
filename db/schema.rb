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

ActiveRecord::Schema.define(version: 20161218222255) do

  create_table "answers", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "participant_id"
    t.string   "path"
    t.string   "request_headers"
    t.string   "request_body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "default"
  end

  create_table "apis", force: :cascade do |t|
    t.string   "name"
    t.string   "doc_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "root"
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "answer_id"
    t.text     "headers"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "api_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "practice",    default: false
  end

end
