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

ActiveRecord::Schema.define(version: 20161021153253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocked_friends", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blocked_friends_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "read_status"
    t.string   "photo"
    t.integer  "read_count_allowed"
    t.index ["recipient_id"], name: "index_messages_on_recipient_id", using: :btree
    t.index ["sender_id"], name: "index_messages_on_sender_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "first_person_id"
    t.integer  "second_person_id"
    t.integer  "relation"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["first_person_id"], name: "index_relationships_on_first_person_id", using: :btree
    t.index ["second_person_id"], name: "index_relationships_on_second_person_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
  end

  add_foreign_key "blocked_friends", "users"
end
