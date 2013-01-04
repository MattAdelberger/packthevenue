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

ActiveRecord::Schema.define(:version => 20121114010628) do

  create_table "accounts", :force => true do |t|
    t.string   "company_name"
    t.integer  "zip_code",                               :null => false
    t.string   "first_name",                             :null => false
    t.string   "last_name",                              :null => false
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
    t.string   "provider"
    t.string   "uid"
  end

  add_index "accounts", ["email"], :name => "index_accounts_on_email", :unique => true
  add_index "accounts", ["reset_password_token"], :name => "index_accounts_on_reset_password_token", :unique => true

  create_table "activities", :force => true do |t|
    t.integer  "account_id",                            :null => false
    t.string   "name",                                  :null => false
    t.text     "description",                           :null => false
    t.datetime "start",                                 :null => false
    t.datetime "end",                                   :null => false
    t.boolean  "private",            :default => false
    t.string   "address",                               :null => false
    t.string   "city",                                  :null => false
    t.string   "state",                                 :null => false
    t.integer  "zip",                                   :null => false
    t.float    "latitude",                              :null => false
    t.float    "longitude",                             :null => false
    t.boolean  "gmaps"
    t.integer  "min",                :default => 0,     :null => false
    t.integer  "max",                :default => 1,     :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "breakpoints", :force => true do |t|
    t.integer  "activity_id", :null => false
    t.integer  "number"
    t.integer  "discount"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "follows", :force => true do |t|
    t.integer  "followable_id",                      :null => false
    t.string   "followable_type",                    :null => false
    t.integer  "follower_id",                        :null => false
    t.string   "follower_type",                      :null => false
    t.boolean  "blocked",         :default => false, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "follows", ["followable_id", "followable_type"], :name => "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], :name => "fk_follows"

  create_table "payments", :force => true do |t|
    t.integer  "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ticket_types", :force => true do |t|
    t.integer  "activity_id",                 :null => false
    t.string   "ticketname",                  :null => false
    t.integer  "ticket_price",                :null => false
    t.integer  "max_price",                   :null => false
    t.integer  "number",       :default => 1, :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end
