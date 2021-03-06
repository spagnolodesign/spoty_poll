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

ActiveRecord::Schema.define(version: 2019_10_21_092800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contests", force: :cascade do |t|
    t.string "topic"
    t.integer "state", default: 0
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "selections", force: :cascade do |t|
    t.bigint "song_id"
    t.bigint "contest_id"
    t.bigint "user_id"
    t.integer "votes_count", default: 0
    t.index ["contest_id"], name: "index_selections_on_contest_id"
    t.index ["song_id"], name: "index_selections_on_song_id"
    t.index ["user_id"], name: "index_selections_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.string "album"
    t.string "spotify_id"
    t.integer "length_ms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "album_cover_file_name"
    t.string "album_cover_content_type"
    t.bigint "album_cover_file_size"
    t.datetime "album_cover_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "selection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["selection_id"], name: "index_votes_on_selection_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "votes", "selections"
  add_foreign_key "votes", "users"
end
