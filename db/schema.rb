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

ActiveRecord::Schema.define(:version => 20130422054121) do

  create_table "businesses", :force => true do |t|
    t.string   "business_id"
    t.string   "full_address"
    t.boolean  "open"
    t.string   "photo_url"
    t.string   "city"
    t.integer  "review_count"
    t.string   "name"
    t.string   "url"
    t.string   "state"
    t.integer  "stars"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "businesses_categories", :force => true do |t|
    t.integer  "category_id"
    t.integer  "business_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "businesses_schools", :force => true do |t|
    t.integer  "school_id"
    t.integer  "business_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "group_meals", :force => true do |t|
    t.integer  "meal"
    t.datetime "proposed_start_time"
    t.datetime "proposed_end_time"
    t.datetime "set_start_time"
    t.datetime "set_end_time"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "group_meals_participants", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_meal_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "meals", :force => true do |t|
    t.integer  "host"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "location"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "privacy_level"
  end

  create_table "messages", :force => true do |t|
    t.integer  "author"
    t.text     "text"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "group_meal_id"
  end

  create_table "privates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "meal_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reviews", :force => true do |t|
    t.string   "review_id"
    t.integer  "stars"
    t.string   "date"
    t.text     "text"
    t.string   "business_id"
    t.string   "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => ""
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
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "uid"
    t.string   "provider"
    t.integer  "participant"
    t.string   "image"
    t.string   "location"
    t.string   "facebook_url"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
