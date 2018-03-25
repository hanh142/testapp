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

ActiveRecord::Schema.define(version: 20180318155957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commit_comments", force: :cascade do |t|
    t.string   "sha1"
    t.string   "author"
    t.date     "commit_date"
    t.string   "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "commit_tbls", force: :cascade do |t|
    t.string   "sha1"
    t.string   "author"
    t.date     "date"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commits", force: :cascade do |t|
    t.string   "sha1"
    t.string   "author"
    t.date     "date"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "git_comments", force: :cascade do |t|
    t.integer  "index"
    t.string   "sha1"
    t.string   "merge"
    t.string   "author"
    t.string   "date"
    t.string   "comment"
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modfile_tbls", force: :cascade do |t|
    t.string   "sha1"
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modfiles", force: :cascade do |t|
    t.string   "modfile"
    t.string   "sha1"
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search1s", force: :cascade do |t|
    t.string   "sha1"
    t.string   "author"
    t.date     "date"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string   "sha1"
    t.string   "author"
    t.date     "date"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
