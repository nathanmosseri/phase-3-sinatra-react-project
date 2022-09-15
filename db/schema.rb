# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_15_183616) do

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.integer "post_id"
  end

  create_table "followers", force: :cascade do |t|
    t.integer "followers_id"
    t.integer "following_id"
    t.index ["followers_id"], name: "index_followers_on_followers_id"
    t.index ["following_id"], name: "index_followers_on_following_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "phase"
  end

  create_table "posts", force: :cascade do |t|
    t.string "body"
    t.string "link"
    t.integer "user_id"
    t.integer "likes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "bio"
    t.string "email"
    t.string "links"
    t.integer "phase_id"
    t.string "password"
  end

end
