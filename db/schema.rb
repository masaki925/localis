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

ActiveRecord::Schema.define(:version => 20130309063423) do

  create_table "request_spots", :force => true do |t|
    t.integer  "request_id", :null => false
    t.integer  "spot_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "requests", :force => true do |t|
    t.integer  "user_id",                             :null => false
    t.string   "username",                            :null => false
    t.string   "title",                               :null => false
    t.datetime "start_datetime",                      :null => false
    t.datetime "end_datetime",                        :null => false
    t.integer  "people_num",       :default => 0,     :null => false
    t.float    "budget_hotel",     :default => 0.0,   :null => false
    t.float    "budget_meal",      :default => 0.0,   :null => false
    t.boolean  "option_transport", :default => false, :null => false
    t.boolean  "option_edit",                         :null => false
    t.boolean  "option_pdf",                          :null => false
    t.boolean  "option_booking",                      :null => false
    t.boolean  "option_guide",                        :null => false
    t.boolean  "option_qa",                           :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.string   "password"
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
