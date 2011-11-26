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

ActiveRecord::Schema.define(:version => 20111113214202) do

  create_table "items", :force => true do |t|
    t.string   "type"
    t.integer  "trader_id"
    t.integer  "health",     :default => 100
    t.boolean  "in_use",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.float    "lat"
    t.float    "lon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rivers", :force => true do |t|
    t.integer  "position"
    t.integer  "min_depth"
    t.integer  "max_depth"
    t.boolean  "ferry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "traders", :force => true do |t|
    t.string   "type"
    t.integer  "position",   :default => 0
    t.integer  "user_id"
    t.integer  "money"
    t.integer  "speed"
    t.integer  "ration"
    t.integer  "days",       :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travelers", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "health",             :default => 100
    t.integer  "traveling_party_id"
    t.string   "illnesses",          :default => "00000"
    t.string   "profession"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "f_id"
    t.string   "f_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
