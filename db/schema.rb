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

ActiveRecord::Schema.define(version: 20150716222746) do

  create_table "albums", force: :cascade do |t|
    t.integer  "band_id"
    t.string   "title",                         null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "place",      default: "studio", null: false
  end

  add_index "albums", ["band_id"], name: "index_albums_on_band_id"

  create_table "bands", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "track_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notes", ["track_id"], name: "index_notes_on_track_id"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "tracks", force: :cascade do |t|
    t.integer  "album_id"
    t.string   "name",                       null: false
    t.boolean  "bonus",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "lyrics"
  end

  add_index "tracks", ["album_id"], name: "index_tracks_on_album_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["session_token"], name: "index_users_on_session_token"

end
