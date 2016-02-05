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

ActiveRecord::Schema.define(version: 20160205183700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ex_sets", force: :cascade do |t|
    t.integer  "workout_exercise_id"
    t.float    "weight"
    t.integer  "reps"
    t.integer  "order"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "ex_sets", ["workout_exercise_id"], name: "index_ex_sets_on_workout_exercise_id", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "body_part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.integer  "workout_id"
    t.integer  "order"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "exercise_name"
  end

  add_index "workout_exercises", ["workout_id"], name: "index_workout_exercises_on_workout_id", using: :btree

  create_table "workouts", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ex_sets", "workout_exercises"
  add_foreign_key "workout_exercises", "workouts"
end
