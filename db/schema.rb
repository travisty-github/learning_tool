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

ActiveRecord::Schema.define(version: 20151225080451) do

  create_table "chunks", force: true do |t|
    t.integer  "subject_id"
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chunks", ["subject_id"], name: "index_chunks_on_subject_id"

  create_table "recall_tests", force: true do |t|
    t.integer  "chunk_id"
    t.boolean  "recalled_correctly"
    t.datetime "recall_date"
  end

  add_index "recall_tests", ["chunk_id"], name: "index_recall_tests_on_chunk_id"

  create_table "subjects", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
