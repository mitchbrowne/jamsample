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

ActiveRecord::Schema.define(version: 2020_03_19_011015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.text "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image", default: "https://previews.123rf.com/images/vladwel/vladwel1605/vladwel160500181/57404563-vinyl-record-vector-icon-compact-cd-disk-dvd-disc-gramophone-record-symbol-rotating-record-disc-flat.jpg"
  end

  create_table "genres", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_samples", id: false, force: :cascade do |t|
    t.integer "genre_id"
    t.integer "sample_id"
  end

  create_table "samples", force: :cascade do |t|
    t.text "title"
    t.text "audio_file"
    t.text "image", default: "https://st.depositphotos.com/1742172/2007/v/950/depositphotos_20077185-stock-illustration-cartoon-music-note.jpg"
    t.text "sample_type"
    t.integer "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.text "name"
  end

end
