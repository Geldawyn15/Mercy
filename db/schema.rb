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

ActiveRecord::Schema.define(version: 2019_05_27_141050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.bigint "gamer_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["gamer_id"], name: "index_friendships_on_gamer_id"
  end

  create_table "game_gamer_profiles", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "gamer_id"
    t.string "lancher_tag"
    t.string "rank"
    t.string "mainrole"
    t.jsonb "profile"
    t.jsonb "complete"
    t.jsonb "mainhero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_gamer_profiles_on_game_id"
    t.index ["gamer_id"], name: "index_game_gamer_profiles_on_gamer_id"
  end

  create_table "gamer_reviews", force: :cascade do |t|
    t.bigint "gamer_id"
    t.boolean "add_friend"
    t.boolean "endorse"
    t.boolean "nok", default: false
    t.boolean "nok_positiveness"
    t.boolean "nok_respect"
    t.boolean "nok_communication"
    t.boolean "nok_helpfulness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gamer_id"], name: "index_gamer_reviews_on_gamer_id"
  end

  create_table "gamers", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.date "birth_date"
    t.string "langage"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "rank_typology"
    t.integer "players_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_memberships", force: :cascade do |t|
    t.bigint "gamer_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gamer_id"], name: "index_team_memberships_on_gamer_id"
    t.index ["team_id"], name: "index_team_memberships_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "spirit"
    t.string "rank_scale"
    t.integer "rating"
    t.text "comment"
    t.bigint "game_gamer_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_gamer_profile_id"], name: "index_teams_on_game_gamer_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friendships", "gamers"
  add_foreign_key "friendships", "gamers", column: "friend_id"
  add_foreign_key "game_gamer_profiles", "gamers"
  add_foreign_key "game_gamer_profiles", "games"
  add_foreign_key "gamer_reviews", "gamers"
  add_foreign_key "team_memberships", "gamers"
  add_foreign_key "team_memberships", "teams"
  add_foreign_key "teams", "game_gamer_profiles"
end
