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

ActiveRecord::Schema.define(version: 20150403175142) do

  create_table "assignments", force: true do |t|
    t.integer  "employee_profile_id"
    t.integer  "job_order_id"
    t.decimal  "pay_rate"
    t.decimal  "bill_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["employee_profile_id"], name: "index_assignments_on_employee_profile_id"
  add_index "assignments", ["job_order_id"], name: "index_assignments_on_job_order_id"

  create_table "company_profiles", force: true do |t|
    t.string   "company_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "balance"
  end

  create_table "employee_profiles", force: true do |t|
    t.string   "ssn"
    t.integer  "w2_box5"
    t.string   "marital_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "employee_name"
  end

  create_table "job_orders", force: true do |t|
    t.string   "job_title"
    t.text     "job_description"
    t.boolean  "active",             default: true
    t.integer  "company_profile_id"
    t.date     "fill_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_orders", ["company_profile_id"], name: "index_job_orders_on_company_profile_id"

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.integer  "profileable_id"
    t.string   "profileable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["name"], name: "index_profiles_on_name"
  add_index "profiles", ["profileable_id", "profileable_type"], name: "index_profiles_on_profileable_id_and_profileable_type"

  create_table "shifts", force: true do |t|
    t.integer  "assignment_id"
    t.date     "week"
    t.decimal  "hours_worked"
    t.datetime "time_in"
    t.datetime "time_out"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shifts", ["assignment_id"], name: "index_shifts_on_assignment_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_type"
    t.string   "profile_id"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["profile_id", "profile_type"], name: "index_users_on_profile_id_and_profile_type"

end
