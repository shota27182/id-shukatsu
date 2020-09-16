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

ActiveRecord::Schema.define(version: 2020_09_16_115712) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "article_images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "article_tags", force: :cascade do |t|
    t.integer "article_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_tags_on_article_id"
    t.index ["tag_id"], name: "index_article_tags_on_tag_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.string "created_by"
    t.integer "day_pageview", default: 0, null: false
  end

  create_table "average_salaries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "company_condolences", force: :cascade do |t|
    t.integer "company_id"
    t.integer "condolence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_condolences_on_company_id"
    t.index ["condolence_id"], name: "index_company_condolences_on_condolence_id"
  end

  create_table "company_detail_generals", force: :cascade do |t|
    t.integer "company_general_id"
    t.integer "man"
    t.integer "woman"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_general_id"], name: "index_company_detail_generals_on_company_general_id"
  end

  create_table "company_features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "company_generals", force: :cascade do |t|
    t.integer "company_id"
    t.integer "man"
    t.integer "woman"
    t.integer "humanity_man"
    t.integer "humanity_woman"
    t.integer "science_man"
    t.integer "science_woman"
    t.integer "work_duration"
    t.integer "overtime"
    t.integer "holiday_use"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_generals_on_company_id"
  end

  create_table "company_healths", force: :cascade do |t|
    t.integer "company_id"
    t.integer "health_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_healths_on_company_id"
    t.index ["health_id"], name: "index_company_healths_on_health_id"
  end

  create_table "company_holidays", force: :cascade do |t|
    t.integer "company_id"
    t.integer "holiday_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_holidays_on_company_id"
    t.index ["holiday_id"], name: "index_company_holidays_on_holiday_id"
  end

  create_table "company_house_allowances", force: :cascade do |t|
    t.integer "company_id"
    t.integer "house_allowance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_house_allowances_on_company_id"
    t.index ["house_allowance_id"], name: "index_company_house_allowances_on_house_allowance_id"
  end

  create_table "company_industries", force: :cascade do |t|
    t.integer "company_id"
    t.integer "industry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_industries_on_company_id"
    t.index ["industry_id"], name: "index_company_industries_on_industry_id"
  end

  create_table "company_nursings", force: :cascade do |t|
    t.integer "company_id"
    t.integer "nursing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_nursings_on_company_id"
    t.index ["nursing_id"], name: "index_company_nursings_on_nursing_id"
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
    t.string "image"
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
    t.string "image"
  end

  create_table "company_teleworks", force: :cascade do |t|
    t.integer "company_id"
    t.integer "telework_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_teleworks_on_company_id"
    t.index ["telework_id"], name: "index_company_teleworks_on_telework_id"
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

  create_table "company_work_times", force: :cascade do |t|
    t.integer "company_id"
    t.integer "work_time_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_work_times_on_company_id"
    t.index ["work_time_id"], name: "index_company_work_times_on_work_time_id"
  end

  create_table "condolences", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "event_images", force: :cascade do |t|
    t.integer "event_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["event_id"], name: "index_event_images_on_event_id"
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
    t.string "url"
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

  create_table "first_salaries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "healths", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holidays", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "house_allowances", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "invite_id"
    t.integer "invited_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invite_id", "invited_id"], name: "index_invitations_on_invite_id_and_invited_id", unique: true
    t.index ["invite_id"], name: "index_invitations_on_invite_id"
    t.index ["invited_id"], name: "index_invitations_on_invited_id"
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

  create_table "nursings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occupations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "programmings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "first_salary_id"
    t.integer "average_salary_id"
    t.index ["average_salary_id"], name: "index_salaries_on_average_salary_id"
    t.index ["company_id"], name: "index_salaries_on_company_id"
    t.index ["first_salary_id"], name: "index_salaries_on_first_salary_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teleworks", force: :cascade do |t|
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
    t.boolean "activate"
    t.date "activated_at"
    t.boolean "inactivate"
    t.date "inactivated_at"
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
    t.string "invitation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "welfares", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
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
    t.string "image"
  end

  create_table "work_styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "work_times", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
