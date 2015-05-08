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

ActiveRecord::Schema.define(version: 20150508130534) do

  create_table "agency_profiles", force: :cascade do |t|
    t.string   "agency_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "employee_profile_id"
    t.integer  "job_order_id"
    t.decimal  "pay_rate"
    t.decimal  "bill_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",               limit: 255
  end

  add_index "assignments", ["employee_profile_id"], name: "index_assignments_on_employee_profile_id"
  add_index "assignments", ["job_order_id"], name: "index_assignments_on_job_order_id"
  add_index "assignments", ["state"], name: "index_assignments_on_state"

  create_table "company_profiles", force: :cascade do |t|
    t.string   "company_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "balance"
  end

  create_table "employee_profiles", force: :cascade do |t|
    t.string   "ssn",            limit: 255
    t.integer  "w2_box5"
    t.string   "marital_status", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "employee_name",  limit: 255
  end

  create_table "job_orders", force: :cascade do |t|
    t.string   "job_title",          limit: 255
    t.text     "job_description"
    t.boolean  "active",                         default: true
    t.integer  "company_profile_id"
    t.date     "fill_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",              limit: 255
    t.integer  "needed"
    t.boolean  "asap",                           default: false
    t.integer  "agency_profile_id"
    t.decimal  "est_pay"
    t.decimal  "est_bill"
    t.integer  "acct_manager_id"
    t.string   "type"
  end

  add_index "job_orders", ["acct_manager_id"], name: "index_job_orders_on_acct_manager_id"
  add_index "job_orders", ["agency_profile_id"], name: "index_job_orders_on_agency_profile_id"
  add_index "job_orders", ["company_profile_id"], name: "index_job_orders_on_company_profile_id"
  add_index "job_orders", ["state"], name: "index_job_orders_on_state"

  create_table "profiles", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "profileable_id"
    t.string   "profileable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["name"], name: "index_profiles_on_name"
  add_index "profiles", ["profileable_id", "profileable_type"], name: "index_profiles_on_profileable_id_and_profileable_type"

  create_table "shifts", force: :cascade do |t|
    t.integer  "assignment_id"
    t.decimal  "hours_worked"
    t.datetime "time_in"
    t.datetime "time_out"
    t.string   "state",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "timesheet_id"
    t.integer  "week"
  end

  add_index "shifts", ["assignment_id"], name: "index_shifts_on_assignment_id"
  add_index "shifts", ["state"], name: "index_shifts_on_state"

  create_table "timesheets", force: :cascade do |t|
    t.integer  "assignment_id"
    t.integer  "week"
    t.string   "state",         limit: 255
    t.decimal  "reg_hours"
    t.decimal  "ot_hours"
    t.decimal  "gross_pay"
    t.decimal  "gross_bill"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "timesheets", ["assignment_id"], name: "index_timesheets_on_assignment_id"
  add_index "timesheets", ["state"], name: "index_timesheets_on_state"

  create_table "users", force: :cascade do |t|
    t.string   "email",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest",   limit: 255
    t.string   "remember_digest",   limit: 255
    t.boolean  "admin",                         default: false
    t.string   "activation_digest", limit: 255
    t.boolean  "activated",                     default: false
    t.datetime "activated_at"
    t.string   "reset_digest",      limit: 255
    t.datetime "reset_sent_at"
    t.string   "first_name",        limit: 255
    t.string   "last_name",         limit: 255
    t.string   "profile_type",      limit: 255
    t.string   "profile_id",        limit: 255
    t.string   "role",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["profile_id", "profile_type"], name: "index_users_on_profile_id_and_profile_type"

end
