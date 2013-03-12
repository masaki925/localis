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

ActiveRecord::Schema.define(:version => 20130312053557) do

  create_table "activities", :force => true do |t|
    t.string   "name",        :limit => 45
    t.text     "description"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "generals", :force => true do |t|
    t.string   "title",          :limit => 45
    t.string   "country_code",   :limit => 2
    t.text     "visa"
    t.text     "climate"
    t.text     "payment"
    t.text     "annual_events"
    t.text     "transportation"
    t.text     "price"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "menus", :force => true do |t|
    t.string   "name",        :limit => 45
    t.text     "description"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "plan_days", :force => true do |t|
    t.integer  "plan_id"
    t.integer  "day"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "plan_days", ["plan_id"], :name => "index_plan_days_on_plan_id"

  create_table "plan_spots", :force => true do |t|
    t.integer  "plan_day_id"
    t.integer  "spot_id"
    t.text     "comment"
    t.integer  "timetogo"
    t.integer  "order"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "plan_spots", ["plan_day_id"], :name => "index_plan_spots_on_plan_day_id"
  add_index "plan_spots", ["spot_id"], :name => "index_plan_spots_on_spot_id"

  create_table "plans", :force => true do |t|
    t.string   "title",      :limit => 45
    t.integer  "user_id"
    t.integer  "request_id"
    t.boolean  "purchased"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "plans", ["request_id"], :name => "index_plans_on_request_id"
  add_index "plans", ["user_id"], :name => "index_plans_on_user_id"

  create_table "request_hotels", :force => true do |t|
    t.integer  "request_id"
    t.integer  "spot_id"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "request_hotels", ["request_id"], :name => "index_request_hotels_on_request_id"
  add_index "request_hotels", ["spot_id"], :name => "index_request_hotels_on_spot_id"

  create_table "request_spots", :force => true do |t|
    t.integer  "request_id", :null => false
    t.integer  "spot_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "request_spots", ["request_id"], :name => "index_request_spots_on_request_id"
  add_index "request_spots", ["spot_id"], :name => "index_request_spots_on_spot_id"

  create_table "requests", :force => true do |t|
    t.integer  "user_id",                                           :null => false
    t.string   "username",                                          :null => false
    t.string   "title",            :limit => 45,                    :null => false
    t.datetime "start_datetime",                                    :null => false
    t.datetime "end_datetime",                                      :null => false
    t.integer  "people_num",                     :default => 0,     :null => false
    t.float    "budget_hotel",                   :default => 0.0,   :null => false
    t.float    "budget_meal",                    :default => 0.0,   :null => false
    t.boolean  "option_transport",               :default => false, :null => false
    t.boolean  "option_edit",                    :default => false, :null => false
    t.boolean  "option_pdf",                     :default => false, :null => false
    t.boolean  "option_booking",                 :default => false, :null => false
    t.boolean  "option_guide",                   :default => false, :null => false
    t.boolean  "option_qa",                      :default => false, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "requests", ["user_id"], :name => "index_requests_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "spot_candidates", :force => true do |t|
    t.integer  "request_id"
    t.integer  "spot_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "spot_candidates", ["request_id"], :name => "index_spot_candidates_on_request_id"
  add_index "spot_candidates", ["spot_id"], :name => "index_spot_candidates_on_spot_id"
  add_index "spot_candidates", ["user_id"], :name => "index_spot_candidates_on_user_id"

  create_table "spot_categories", :force => true do |t|
    t.string   "name",       :limit => 45
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "spot_popular_activities", :force => true do |t|
    t.integer  "spot_id"
    t.integer  "activity_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "spot_popular_activities", ["activity_id"], :name => "index_spot_popular_activities_on_activity_id"
  add_index "spot_popular_activities", ["spot_id"], :name => "index_spot_popular_activities_on_spot_id"

  create_table "spot_popular_menus", :force => true do |t|
    t.integer  "spot_id"
    t.integer  "menu_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spot_tours", :force => true do |t|
    t.integer  "spot_id"
    t.integer  "tour_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "spot_tours", ["spot_id"], :name => "index_spot_tours_on_spot_id"
  add_index "spot_tours", ["tour_id"], :name => "index_spot_tours_on_tour_id"

  create_table "spots", :force => true do |t|
    t.string   "name",             :limit => 45, :null => false
    t.string   "address",          :limit => 45
    t.string   "tel",              :limit => 45
    t.integer  "take_time"
    t.integer  "spot_category_id"
    t.float    "cost"
    t.string   "station",          :limit => 45
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "spots", ["spot_category_id"], :name => "index_spots_on_spot_category_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tours", :force => true do |t|
    t.string   "name",        :limit => 45
    t.text     "description"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.string   "password"
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "fb_name"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
