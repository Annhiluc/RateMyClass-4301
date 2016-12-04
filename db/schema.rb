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

ActiveRecord::Schema.define(version: 1) do

  create_table "course", primary_key: "course_id", force: :cascade do |t|
    t.string  "name",               limit: 40,                          null: false
    t.string  "average_grade",      limit: 1
    t.decimal "average_interest",              precision: 2,  scale: 1
    t.decimal "average_difficulty",            precision: 2,  scale: 1
    t.integer "dept_id",                       precision: 38
    t.integer "prof_id",                       precision: 38
  end

  create_table "department", primary_key: "dept_id", force: :cascade do |t|
    t.string  "name",      limit: 40,                null: false
    t.integer "school_id",            precision: 38
  end

  add_index "department", ["name"], name: "sys_c00483452", unique: true

  create_table "professor", primary_key: "prof_id", force: :cascade do |t|
    t.string  "name",                    limit: 40,                          null: false
    t.decimal "average_rating_interest",            precision: 2,  scale: 1
    t.decimal "average_rating_grading",             precision: 2,  scale: 1
    t.decimal "average_rating_helpful",             precision: 2,  scale: 1
    t.decimal "average_rating_lecture",             precision: 2,  scale: 1
    t.integer "dept_id",                            precision: 38
  end

  create_table "ratecourse", id: false, force: :cascade do |t|
    t.decimal "rating_difficult",            precision: 2,  scale: 1
    t.decimal "rating_interest",             precision: 2,  scale: 1
    t.integer "course_id",                   precision: 38
    t.string  "user_id",          limit: 40,
  end

  create_table "rateprofessor", id: false, force: :cascade do |t|
    t.decimal "rating_lecture",             precision: 2,  scale: 1
    t.decimal "rating_grading",             precision: 2,  scale: 1
    t.decimal "rating_helpful",             precision: 2,  scale: 1
    t.decimal "rating_interest",            precision: 2,  scale: 1
    t.integer "prof_id",                    precision: 38
    t.string  "user_id",         limit: 40
  end

  create_table "school", primary_key: "school_id", force: :cascade do |t|
    t.string "name",  limit: 40, null: false
    t.string "state", limit: 40
    t.string "city",  limit: 40
  end

  add_index "school", ["name"], name: "sys_c00483449", unique: true

  create_table "student", primary_key: "user_id", id: :string, limit: 40, force: :cascade do |t|
    t.string  "name",        limit: 40,                null: false
    t.integer "school_year",            precision: 38
    t.string  "password",    limit: 40,                null: false
  end

  add_foreign_key "course", "department", column: "dept_id", primary_key: "dept_id", name: "course_deptfkey"
  add_foreign_key "course", "professor", column: "prof_id", primary_key: "prof_id", name: "course_proffkey"
  add_foreign_key "department", "school", primary_key: "school_id", name: "dept_schoolfkey"
  add_foreign_key "professor", "department", column: "dept_id", primary_key: "dept_id", name: "prof_deptfkey"
  add_foreign_key "ratecourse", "course", primary_key: "course_id", name: "ratecourse_coursefkey"
  add_foreign_key "ratecourse", "student", column: "user_id", primary_key: "user_id", name: "rate_course_userfkey"
  add_foreign_key "rateprofessor", "professor", column: "prof_id", primary_key: "prof_id", name: "rateprof_proffkey"
  add_foreign_key "rateprofessor", "student", column: "user_id", primary_key: "user_id", name: "rateprof_userfkey"
end
