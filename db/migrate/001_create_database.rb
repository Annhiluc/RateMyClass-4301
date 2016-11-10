class CreateDatabase < ActiveRecord::Migration
    def self.up
        
        create_table "course", primary_key: "course_id", id: :decimal, force: :cascade do |t|
            t.string  "name",               limit: 40,                         null: false
            t.string  "average_grade",      limit: 1
            t.decimal "average_interest",              precision: 2, scale: 1
            t.decimal "average_difficulty",            precision: 2, scale: 1
            t.decimal "dept_id"
            t.decimal "prof_id"
        end

        create_table "department", primary_key: "dept_id", id: :decimal, force: :cascade do |t|
            t.string  "name",      limit: 40, null: false
            t.decimal "school_id"
        end

        add_index "department", ["name"], name: "sys_c00483452", unique: true

        create_table "professor", primary_key: "prof_id", id: :decimal, force: :cascade do |t|
            t.string  "name",                    limit: 40,                         null: false
            t.decimal "average_rating_interest",            precision: 2, scale: 1
            t.decimal "average_rating_grading",             precision: 2, scale: 1
            t.decimal "average_rating_helpful",             precision: 2, scale: 1
            t.decimal "average_rating_lecture",             precision: 2, scale: 1
            t.decimal "dept_id"
        end

        create_table "ratecourse", id: false, force: :cascade do |t|
            t.decimal "rating_difficult",            precision: 2, scale: 1
            t.decimal "rating_interest",             precision: 2, scale: 1
            t.decimal "course_id"
            t.string  "user_id",          limit: 40
        end

        create_table "rateprofessor", id: false, force: :cascade do |t|
            t.decimal "rating_lecture",             precision: 2, scale: 1
            t.decimal "rating_grading",             precision: 2, scale: 1
            t.decimal "rating_helpful",             precision: 2, scale: 1
            t.decimal "rating_interest",            precision: 2, scale: 1
            t.decimal "prof_id"
            t.string  "user_id",         limit: 40
        end

        create_table "school", primary_key: "school_id", id: :decimal, force: :cascade do |t|
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

    def self.down
        
        drop_table "course"
        drop_table "department"
        drop_table "professor"
        drop_table "ratecourse"
        drop_table "rateprofessor"
        drop_table "school"
        drop_table "student"
    end
end