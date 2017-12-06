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

ActiveRecord::Schema.define(version: 20171206134631) do

  create_table "books", force: :cascade do |t|
    t.string  "title"
    t.string  "author"
    t.string  "genre"
    t.integer "year"
    t.string  "description"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "status"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

end
