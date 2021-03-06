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

ActiveRecord::Schema.define(version: 20170312210814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "minimum",             default: 2
    t.integer  "maximum",             default: 4
    t.boolean  "include_semi_finals", default: false
    t.boolean  "include_finals",      default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "draft_picks", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "round_drafted"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.integer  "round"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.string   "name"
    t.integer  "number_of_rounds", default: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "team_name"
    t.string   "team_abbr"
    t.integer  "start_order",      default: 0
    t.boolean  "admin",            default: false
    t.integer  "semifinals_order", default: 0
    t.integer  "finals_order",     default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "match_id"
    t.integer  "vote_for_team_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
