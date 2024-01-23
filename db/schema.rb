# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_22_165948) do
  create_table "announcements", force: :cascade do |t|
    t.date "publication_date"
    t.string "title"
    t.text "message"
    t.integer "posted_by_id"
    t.integer "concerned_position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concerned_position_id"], name: "index_announcements_on_concerned_position_id"
    t.index ["posted_by_id"], name: "index_announcements_on_posted_by_id"
  end

  create_table "employees", force: :cascade do |t|
    t.integer "LDAP"
    t.string "name"
    t.string "email"
    t.string "position"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leave_requests", force: :cascade do |t|
    t.integer "employee_id"
    t.date "request_date"
    t.date "leave_start_date"
    t.date "leave_end_date"
    t.string "response", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_leave_requests_on_employee_id"
  end

  create_table "performance_evaluations", force: :cascade do |t|
    t.date "evaluation_date"
    t.integer "employee_reviewed_id"
    t.integer "reviewer_id"
    t.integer "note"
    t.text "commentary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_reviewed_id"], name: "index_performance_evaluations_on_employee_reviewed_id"
    t.index ["reviewer_id"], name: "index_performance_evaluations_on_reviewer_id"
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

  add_foreign_key "announcements", "employees", column: "concerned_position_id"
  add_foreign_key "announcements", "employees", column: "posted_by_id"
  add_foreign_key "leave_requests", "employees"
  add_foreign_key "performance_evaluations", "employees", column: "employee_reviewed_id"
  add_foreign_key "performance_evaluations", "employees", column: "reviewer_id"
end
