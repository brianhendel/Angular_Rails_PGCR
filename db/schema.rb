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

ActiveRecord::Schema.define(version: 20161216031833) do

  create_table "activities", force: :cascade do |t|
    t.integer  "activityId"
    t.integer  "mode"
    t.integer  "mainScore"
    t.integer  "mainKills"
    t.integer  "mainDeaths"
    t.string   "mainStanding"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "activity_entries", force: :cascade do |t|
    t.string   "gamertag"
    t.integer  "score"
    t.integer  "kills"
    t.integer  "deaths"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_activity_entries_on_activity_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "gamertag"
    t.integer  "memberId",   limit: 8
    t.integer  "charId_1",   limit: 8
    t.integer  "charId_2",   limit: 8
    t.integer  "charId_3",   limit: 8
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
