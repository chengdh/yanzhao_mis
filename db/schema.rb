# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100626103539) do

  create_table "base_public_messages", :force => true do |t|
    t.string   "title",        :limit => 200,                    :null => false
    t.string   "body",         :limit => 500
    t.string   "type",         :limit => 20
    t.boolean  "is_secure",                   :default => false, :null => false
    t.string   "state",        :limit => 20,                     :null => false
    t.integer  "org_id"
    t.boolean  "is_active"
    t.integer  "user_id"
    t.datetime "publish_date"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "base_public_messages_orgs", :id => false, :force => true do |t|
    t.integer "base_public_message_id"
    t.integer "org_id"
  end

  create_table "contracts", :force => true do |t|
    t.integer  "org_id"
    t.date     "date_from"
    t.date     "date_to"
    t.integer  "radio_start", :limit => 10, :precision => 10, :scale => 0
    t.integer  "radio_back",  :limit => 10, :precision => 10, :scale => 0
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_visitors", :force => true do |t|
    t.integer  "base_public_message_id",                :null => false
    t.integer  "user_id",                               :null => false
    t.datetime "visited_at"
    t.string   "note",                   :limit => 200
    t.string   "state",                  :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orgs", :force => true do |t|
    t.string   "name",       :limit => 60,                    :null => false
    t.integer  "user_id"
    t.boolean  "is_active",                 :default => true, :null => false
    t.string   "address",    :limit => 100
    t.string   "phone",      :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",       :limit => 20
  end

  create_table "users", :force => true do |t|
    t.string   "username",   :limit => 20,                   :null => false
    t.boolean  "is_active",                :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "org_id"
  end

end
