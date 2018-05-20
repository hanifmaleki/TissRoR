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

ActiveRecord::Schema.define(version: 2018_05_17_113235) do

  create_table "courses", force: :cascade do |t|
    t.string "courseNumber"
    t.string "semesterCode"
    t.string "courseType"
    t.string "title"
    t.string "objective"
    t.string "trachingContent"
    t.string "lectureNotes"
    t.string "examinationModalities"
    t.string "recommendation"
    t.integer "precedingCourses"
    t.string "weeklyHours"
    t.integer "lecturers"
    t.string "instituteCode"
    t.string "instituteName"
    t.string "registration"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourite_courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "item_id"
    t.string "item_title"
    t.string "item_type"
  end

  create_table "people", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "gender"
    t.string "preceding_titles"
    t.string "picture_uri"
    t.string "main_phone_number"
    t.string "main_email"
    t.string "consultation_hour_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "contractBegin"
    t.string "contractEnd"
    t.string "projectBegin"
    t.string "projectEnd"
    t.string "projectFrom"
    t.string "projectType"
    t.string "abstract"
    t.string "researchArea"
    t.string "institue"
    t.string "keywords"
    t.string "financier"
    t.string "funding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "theses", force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.string "institue"
    t.string "institueName"
    t.string "facultyCode"
    t.string "keywords"
    t.string "language"
    t.string "advisor"
    t.string "facultyName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "family"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
