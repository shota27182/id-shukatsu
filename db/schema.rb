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

ActiveRecord::Schema.define(version: 2020_07_28_035054) do

  create_table "admin_users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "activation_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "article_images", force: :cascade do |t|
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.index ["article_id"], name: "index_article_images_on_article_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.string "created_by"
  end

  create_table "basics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_basics_on_user_id"
  end

  create_table "cancel_users", force: :cascade do |t|
    t.integer "user"
    t.integer "event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "introduction"
    t.string "category"
    t.integer "people"
    t.string "url"
    t.string "img"
    t.date "establishment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "icon"
    t.string "address"
    t.string "kana"
  end

  create_table "company_company_features", force: :cascade do |t|
    t.integer "company_id"
    t.integer "company_feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_feature_id"], name: "index_company_company_features_on_company_feature_id"
    t.index ["company_id"], name: "index_company_company_features_on_company_id"
  end

  create_table "company_company_points", force: :cascade do |t|
    t.integer "company_id"
    t.integer "company_point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_company_points_on_company_id"
    t.index ["company_point_id"], name: "index_company_company_points_on_company_point_id"
  end

  create_table "company_company_scales", force: :cascade do |t|
    t.integer "company_scale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_company_company_scales_on_company_id"
    t.index ["company_scale_id"], name: "index_company_company_scales_on_company_scale_id"
  end

  create_table "company_features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_industries", force: :cascade do |t|
    t.integer "company_id"
    t.integer "industry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_industries_on_company_id"
    t.index ["industry_id"], name: "index_company_industries_on_industry_id"
  end

  create_table "company_occupations", force: :cascade do |t|
    t.integer "company_id"
    t.integer "occupation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_occupations_on_company_id"
    t.index ["occupation_id"], name: "index_company_occupations_on_occupation_id"
  end

  create_table "company_points", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_profiles", force: :cascade do |t|
    t.integer "company_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_profiles_on_company_id"
  end

  create_table "company_requirements", force: :cascade do |t|
    t.integer "company_id"
    t.text "occupation"
    t.text "work"
    t.text "qualification"
    t.text "holiday"
    t.text "welfare"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_requirements_on_company_id"
  end

  create_table "company_scales", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_welfares", force: :cascade do |t|
    t.integer "company_id"
    t.integer "welfare_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_welfares_on_company_id"
    t.index ["welfare_id"], name: "index_company_welfares_on_welfare_id"
  end

  create_table "company_work_areas", force: :cascade do |t|
    t.integer "company_id"
    t.integer "work_area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_work_areas_on_company_id"
    t.index ["work_area_id"], name: "index_company_work_areas_on_work_area_id"
  end

  create_table "company_work_styles", force: :cascade do |t|
    t.integer "company_id"
    t.integer "work_style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_work_styles_on_company_id"
    t.index ["work_style_id"], name: "index_company_work_styles_on_work_style_id"
  end

  create_table "departments", force: :cascade do |t|
    t.integer "faculty_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_departments_on_faculty_id"
  end

  create_table "educations", force: :cascade do |t|
    t.date "graduation"
    t.string "classification"
    t.text "seminar"
    t.string "highschool"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "university"
    t.string "faculty"
    t.string "department"
    t.integer "grade_id"
    t.index ["grade_id"], name: "index_educations_on_grade_id"
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "event_histories", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_histories_on_event_id"
    t.index ["user_id"], name: "index_event_histories_on_user_id"
  end

  create_table "event_profiles", force: :cascade do |t|
    t.integer "event_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_profiles_on_event_id"
  end

  create_table "event_schedules", force: :cascade do |t|
    t.string "title"
    t.time "start_time"
    t.time "end_time"
    t.string "place"
    t.string "address"
    t.date "deadline"
    t.integer "max_people"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "holding_day"
    t.index ["event_id"], name: "index_event_schedules_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "introduction"
    t.text "point"
    t.text "flow"
    t.integer "category"
    t.integer "company_id"
    t.index ["company_id"], name: "index_events_on_company_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.integer "university_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["university_id"], name: "index_faculties_on_university_id"
  end

  create_table "generals", force: :cascade do |t|
    t.string "name"
    t.string "kana"
    t.string "sex"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "basic_id"
    t.integer "user_id"
    t.string "address1"
    t.string "address2"
    t.string "tel"
    t.string "building_name"
    t.index ["basic_id"], name: "index_generals_on_basic_id"
    t.index ["user_id"], name: "index_generals_on_user_id"
  end

  create_table "grades", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentarity_company_features", force: :cascade do |t|
    t.integer "company_feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["company_feature_id"], name: "index_mentarity_company_features_on_company_feature_id"
    t.index ["user_id"], name: "index_mentarity_company_features_on_user_id"
  end

  create_table "mentarity_company_points", force: :cascade do |t|
    t.integer "company_point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["company_point_id"], name: "index_mentarity_company_points_on_company_point_id"
    t.index ["user_id"], name: "index_mentarity_company_points_on_user_id"
  end

  create_table "mentarity_welfares", force: :cascade do |t|
    t.integer "welfare_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_mentarity_welfares_on_user_id"
    t.index ["welfare_id"], name: "index_mentarity_welfares_on_welfare_id"
  end

  create_table "mentarity_work_styles", force: :cascade do |t|
    t.integer "work_style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_mentarity_work_styles_on_user_id"
    t.index ["work_style_id"], name: "index_mentarity_work_styles_on_work_style_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "content"
    t.boolean "checked", default: false, null: false
    t.datetime "start_on"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "occupations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programmings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_companies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_user_companies_on_company_id"
    t.index ["user_id"], name: "index_user_companies_on_user_id"
  end

  create_table "user_deactivations", force: :cascade do |t|
    t.integer "user"
    t.integer "leave_reason"
    t.text "other_reason"
    t.integer "improve_point"
    t.text "other_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_eikens", force: :cascade do |t|
    t.integer "user_id"
    t.integer "eiken"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_eikens_on_user_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.integer "event_schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["event_schedule_id"], name: "index_user_events_on_event_schedule_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "user_experiences", force: :cascade do |t|
    t.integer "user_id"
    t.text "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_experiences_on_user_id"
  end

  create_table "user_internships", force: :cascade do |t|
    t.integer "user_id"
    t.text "internship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_internships_on_user_id"
  end

  create_table "user_languages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "language"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_languages_on_user_id"
  end

  create_table "user_programmings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "programming_id"
    t.string "use_time"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["programming_id"], name: "index_user_programmings_on_programming_id"
    t.index ["user_id"], name: "index_user_programmings_on_user_id"
  end

  create_table "user_receives", force: :cascade do |t|
    t.integer "magazine"
    t.integer "scout"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_user_receives_on_user_id"
  end

  create_table "user_toefls", force: :cascade do |t|
    t.integer "user_id"
    t.integer "toefl"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_toefls_on_user_id"
  end

  create_table "user_toeics", force: :cascade do |t|
    t.integer "user_id"
    t.integer "toeic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_toeics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.integer "status", default: 0
    t.string "kana"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "welfares", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wish_company_scales", force: :cascade do |t|
    t.integer "company_scale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["company_scale_id"], name: "index_wish_company_scales_on_company_scale_id"
    t.index ["user_id"], name: "index_wish_company_scales_on_user_id"
  end

  create_table "wish_industries", force: :cascade do |t|
    t.integer "industry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["industry_id"], name: "index_wish_industries_on_industry_id"
    t.index ["user_id"], name: "index_wish_industries_on_user_id"
  end

  create_table "wish_occupations", force: :cascade do |t|
    t.integer "occupation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["occupation_id"], name: "index_wish_occupations_on_occupation_id"
    t.index ["user_id"], name: "index_wish_occupations_on_user_id"
  end

  create_table "wish_work_areas", force: :cascade do |t|
    t.integer "user_id"
    t.integer "work_area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wish_work_areas_on_user_id"
    t.index ["work_area_id"], name: "index_wish_work_areas_on_work_area_id"
  end

  create_table "work_areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
