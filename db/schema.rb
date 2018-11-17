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

ActiveRecord::Schema.define(version: 2018_10_18_095701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "classrooms", force: :cascade do |t|
    t.string "subject"
    t.integer "school_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.integer "term"
    t.bigint "grade_id"
    t.boolean "archived"
    t.index ["grade_id"], name: "index_classrooms_on_grade_id"
    t.index ["school_id"], name: "index_classrooms_on_school_id"
    t.index ["student_id"], name: "index_classrooms_on_student_id"
    t.index ["user_id"], name: "index_classrooms_on_user_id"
  end

  create_table "grades", force: :cascade do |t|
    t.string "name"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_grades_on_school_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.string "frequency"
    t.string "symbol"
    t.integer "amount"
    t.string "currency"
    t.text "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_plans_on_name"
  end

  create_table "schooldistricts", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "city"
    t.integer "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.integer "schooldistrict_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["schooldistrict_id"], name: "index_schools_on_schooldistrict_id"
    t.index ["user_id"], name: "index_schools_on_user_id"
  end

  create_table "studentdata", force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.integer "student_id"
    t.integer "user_id"
    t.integer "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_studentdata_on_classroom_id"
    t.index ["student_id"], name: "index_studentdata_on_student_id"
    t.index ["user_id"], name: "index_studentdata_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "classroom_id"
    t.integer "studentdata_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isactive"
    t.string "middlename"
    t.string "name"
    t.index ["classroom_id"], name: "index_students_on_classroom_id"
    t.index ["name"], name: "index_students_on_name"
    t.index ["studentdata_id"], name: "index_students_on_studentdata_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "first_name"
    t.string "last_name"
    t.integer "schooldistrict_id"
    t.integer "school_id"
    t.string "payment_gateway_customer_identifier"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
    t.index ["schooldistrict_id"], name: "index_users_on_schooldistrict_id"
  end

  add_foreign_key "classrooms", "grades"
  add_foreign_key "grades", "schools"
end
