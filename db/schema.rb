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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130409041527) do

  create_table "exercise_sets", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "number_of_reps"
    t.integer  "number_of_sets"
    t.integer  "weight"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "exercise_sets", ["exercise_id"], :name => "index_exercise_sets_on_exercise_id"

  create_table "exercises", :force => true do |t|
    t.integer  "lift_id"
    t.integer  "workout_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "exercises", ["lift_id"], :name => "index_exercises_on_lift_id"
  add_index "exercises", ["workout_id"], :name => "index_exercises_on_workout_id"

  create_table "lifts", :force => true do |t|
    t.string   "lift_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "workouts", :force => true do |t|
    t.datetime "workout_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
  end

end
