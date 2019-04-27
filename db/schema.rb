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

ActiveRecord::Schema.define(version: 2019_04_27_125026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hero_id"
    t.index ["hero_id"], name: "index_areas_on_hero_id"
  end

  create_table "challenge_logs", force: :cascade do |t|
    t.boolean "done"
    t.float "won_xp"
    t.date "date"
    t.bigint "challenge_id"
    t.bigint "daily_journey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_challenge_logs_on_challenge_id"
    t.index ["daily_journey_id"], name: "index_challenge_logs_on_daily_journey_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.float "xp_value"
    t.bigint "hero_id"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_challenges_on_area_id"
    t.index ["hero_id"], name: "index_challenges_on_hero_id"
  end

  create_table "daily_journeys", force: :cascade do |t|
    t.date "date"
    t.float "notation"
    t.float "won_xp"
    t.boolean "locked"
    t.bigint "hero_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_daily_journeys_on_hero_id"
  end

  create_table "habit_chains", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "duration"
    t.bigint "habit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habit_id"], name: "index_habit_chains_on_habit_id"
  end

  create_table "habits", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.boolean "acheived"
    t.bigint "hero_id"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_habits_on_area_id"
    t.index ["hero_id"], name: "index_habits_on_hero_id"
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.float "total_xp"
    t.float "weight"
    t.float "total_money"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_heros_on_user_id"
  end

  create_table "meditation_logs", force: :cascade do |t|
    t.boolean "done"
    t.integer "duration"
    t.date "date"
    t.bigint "daily_journey_id"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_meditation_logs_on_area_id"
    t.index ["daily_journey_id"], name: "index_meditation_logs_on_daily_journey_id"
  end

  create_table "milestones", force: :cascade do |t|
    t.string "name"
    t.boolean "acheived"
    t.boolean "active"
    t.date "deadline"
    t.integer "position"
    t.float "xp_value"
    t.bigint "quest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quest_id"], name: "index_milestones_on_quest_id"
  end

  create_table "mood_logs", force: :cascade do |t|
    t.integer "morning_value"
    t.integer "evening_value"
    t.date "date"
    t.bigint "daily_journey_id"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_mood_logs_on_area_id"
    t.index ["daily_journey_id"], name: "index_mood_logs_on_daily_journey_id"
  end

  create_table "quests", force: :cascade do |t|
    t.string "name"
    t.boolean "acheived"
    t.boolean "active"
    t.string "description"
    t.date "deadline"
    t.float "total_xp"
    t.float "won_xp"
    t.bigint "hero_id"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_quests_on_area_id"
    t.index ["hero_id"], name: "index_quests_on_hero_id"
  end

  create_table "sleep_logs", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.float "sleep_duration"
    t.date "date"
    t.string "comment"
    t.bigint "daily_journey_id"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_sleep_logs_on_area_id"
    t.index ["daily_journey_id"], name: "index_sleep_logs_on_daily_journey_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "done"
    t.date "date"
    t.bigint "daily_journey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_journey_id"], name: "index_tasks_on_daily_journey_id"
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

  create_table "weight_logs", force: :cascade do |t|
    t.float "value"
    t.string "comment"
    t.date "date"
    t.bigint "area_id"
    t.bigint "daily_journey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_weight_logs_on_area_id"
    t.index ["daily_journey_id"], name: "index_weight_logs_on_daily_journey_id"
  end

  add_foreign_key "areas", "heros"
  add_foreign_key "challenge_logs", "challenges"
  add_foreign_key "challenge_logs", "daily_journeys"
  add_foreign_key "challenges", "areas"
  add_foreign_key "challenges", "heros"
  add_foreign_key "daily_journeys", "heros"
  add_foreign_key "habit_chains", "habits"
  add_foreign_key "habits", "areas"
  add_foreign_key "habits", "heros"
  add_foreign_key "heros", "users"
  add_foreign_key "meditation_logs", "areas"
  add_foreign_key "meditation_logs", "daily_journeys"
  add_foreign_key "milestones", "quests"
  add_foreign_key "mood_logs", "areas"
  add_foreign_key "mood_logs", "daily_journeys"
  add_foreign_key "quests", "areas"
  add_foreign_key "quests", "heros"
  add_foreign_key "sleep_logs", "areas"
  add_foreign_key "sleep_logs", "daily_journeys"
  add_foreign_key "tasks", "daily_journeys"
  add_foreign_key "weight_logs", "areas"
  add_foreign_key "weight_logs", "daily_journeys"
end
