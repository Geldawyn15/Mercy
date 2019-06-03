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

ActiveRecord::Schema.define(version: 2019_06_03_082820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "rank_typology"
    t.integer "players_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "user_id"
    t.string "launcher_tag"
    t.string "rank"
    t.string "mainrole"
    t.jsonb "profile"
    t.jsonb "complete"
    t.jsonb "main_hero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_profiles_on_game_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "team_memberships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_memberships_on_team_id"
    t.index ["user_id"], name: "index_team_memberships_on_user_id"
  end

  create_table "team_reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["team_id"], name: "index_team_reviews_on_team_id"
    t.index ["user_id"], name: "index_team_reviews_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "spirit"
    t.string "rank_scale"
    t.string "status", default: "pending"
    t.string "gender_choice"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_teams_on_game_id"
  end

  create_table "user_reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "add_friend"
    t.boolean "endorse"
    t.boolean "nok", default: false
    t.boolean "nok_positiveness", default: false
    t.boolean "nok_respect", default: false
    t.boolean "nok_communication", default: false
    t.boolean "nok_helpfulness", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_reviewed_id"
    t.bigint "team_id"
    t.index ["team_id"], name: "index_user_reviews_on_team_id"
    t.index ["user_id"], name: "index_user_reviews_on_user_id"
    t.index ["user_reviewed_id"], name: "index_user_reviews_on_user_reviewed_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birthdate", default: "1991-12-25"
    t.string "langage", default: "en"
    t.string "location", default: "eu"
    t.string "discord_id"
    t.string "image"
    t.string "username"
    t.string "gender"
    t.string "status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friendships", "users"
  add_foreign_key "friendships", "users", column: "friend_id"
  add_foreign_key "profiles", "games"
  add_foreign_key "profiles", "users"
  add_foreign_key "team_memberships", "teams"
  add_foreign_key "team_memberships", "users"
  add_foreign_key "team_reviews", "teams"
  add_foreign_key "team_reviews", "users"
  add_foreign_key "teams", "games"
  add_foreign_key "user_reviews", "teams"
  add_foreign_key "user_reviews", "users"
  add_foreign_key "user_reviews", "users", column: "user_reviewed_id"
end
