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

ActiveRecord::Schema.define(:version => 20101122075517) do

  create_table "address_book_lines", :force => true do |t|
    t.string   "name",            :limit => 60,                    :null => false
    t.string   "phone",           :limit => 30
    t.string   "mobile",          :limit => 30
    t.boolean  "is_active",                      :default => true, :null => false
    t.integer  "address_book_id",                                  :null => false
    t.string   "location",        :limit => 60
    t.string   "note",            :limit => 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "address_books", :force => true do |t|
    t.integer  "org_id",                       :null => false
    t.integer  "user_id"
    t.boolean  "is_active",  :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "base_public_messages", :force => true do |t|
    t.string   "title",        :limit => 200,                    :null => false
    t.text     "body"
    t.string   "type",         :limit => 20
    t.boolean  "is_secure",                   :default => false, :null => false
    t.string   "state",        :limit => 20,                     :null => false
    t.integer  "org_id"
    t.boolean  "is_active",                   :default => true
    t.integer  "user_id"
    t.datetime "publish_date"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "doc_no",       :limit => 20
  end

  create_table "base_public_messages_orgs", :id => false, :force => true do |t|
    t.integer "base_public_message_id"
    t.integer "org_id"
  end

  create_table "bills", :force => true do |t|
    t.string   "bill_no",        :limit => 30,                                                   :null => false
    t.string   "goods_no",       :limit => 30
    t.string   "bill_mth",       :limit => 6,                                                    :null => false
    t.string   "sender_name",    :limit => 20,                                                   :null => false
    t.string   "sender_phone"
    t.string   "receiver_name"
    t.string   "receiver_phone"
    t.integer  "from_org_id",                                                                    :null => false
    t.integer  "to_org_id",                                                                      :null => false
    t.decimal  "fee",                           :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "goods_fee",                     :precision => 10, :scale => 2, :default => 0.0
    t.integer  "goods_num",                                                    :default => 0
    t.string   "goods_info",     :limit => 200
    t.date     "bill_date"
    t.string   "pay_type",       :limit => 2,                                                    :null => false
    t.boolean  "is_active",                                                    :default => true
    t.string   "state",          :limit => 2,                                  :default => "DR", :null => false
    t.integer  "tk_info_id"
    t.integer  "post_info_id"
    t.decimal  "k_hand_fee",                    :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "k_carrying_fee",                :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "act_pay_fee",                   :precision => 10, :scale => 2, :default => 0.0
    t.string   "bill_type",      :limit => 2
    t.date     "inout_date"
    t.string   "type",           :limit => 60
    t.decimal  "storage_fee",                   :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "clear_fee",                     :precision => 10, :scale => 2, :default => 0.0
    t.integer  "user_id"
    t.integer  "clear_info_id"
    t.integer  "deliver_id"
    t.integer  "confirm_id"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clear_infos", :force => true do |t|
    t.date     "clear_date"
    t.integer  "user_id"
    t.text     "clear_note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "name",              :limit => 60, :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.string   "body",       :limit => 600,                   :null => false
    t.integer  "user_id",                                     :null => false
    t.boolean  "is_active",                 :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "config_infos", :force => true do |t|
    t.string   "config_key",       :limit => 60,                                                 :null => false
    t.string   "config_value",     :limit => 60
    t.decimal  "config_num_from",                :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "config_num_to",                  :precision => 10, :scale => 2, :default => 0.0
    t.date     "config_date_from"
    t.date     "config_date_to"
    t.decimal  "config_value_num",               :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "confirms", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contract_items", :force => true do |t|
    t.string   "name",        :limit => 60,                                                  :null => false
    t.boolean  "is_active",                                                :default => true, :null => false
    t.string   "type",        :limit => 20,                                                  :null => false
    t.decimal  "value",                     :precision => 10, :scale => 2, :default => 0.0
    t.integer  "contract_id",                                                                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mth",         :limit => 6
  end

  create_table "contract_radios", :force => true do |t|
    t.integer  "contract_id",                                                  :null => false
    t.string   "mth",                                                          :null => false
    t.decimal  "start_radio", :precision => 10, :scale => 2, :default => 50.0
    t.decimal  "back_radio",  :precision => 10, :scale => 2, :default => 50.0
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.boolean  "is_active",                                                :default => true,  :null => false
    t.boolean  "alert",                                                    :default => false
  end

  create_table "delivers", :force => true do |t|
    t.date     "deliver_date"
    t.string   "deliver_name",  :limit => 30, :null => false
    t.string   "identify_type", :limit => 30
    t.string   "identify_no",   :limit => 30
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "m_storages", :force => true do |t|
    t.integer  "warehouse_id",                                                   :null => false
    t.integer  "material_id",                                                    :null => false
    t.decimal  "avg_price",    :precision => 10, :scale => 2, :default => 0.0
    t.integer  "qty",                                         :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "alert",                                       :default => false
  end

  create_table "material_inout_lines", :force => true do |t|
    t.integer  "material_inout_id",                                                 :null => false
    t.integer  "material_id",                                                       :null => false
    t.integer  "qty",                                              :default => 1
    t.decimal  "price",             :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "line_amt",          :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_inouts", :force => true do |t|
    t.date     "inout_date",                                    :null => false
    t.integer  "org_id"
    t.integer  "warehouse_id"
    t.string   "person_name",  :limit => 30
    t.string   "note",         :limit => 200
    t.string   "type",         :limit => 30,                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",        :limit => 10,  :default => "DR"
    t.integer  "auditor_id"
    t.integer  "confirm_id"
  end

  create_table "materials", :force => true do |t|
    t.string   "name",        :limit => 60,                         :null => false
    t.boolean  "is_active",                 :default => true,       :null => false
    t.string   "description", :limit => 60
    t.string   "type",        :limit => 30, :default => "Material", :null => false
    t.integer  "min_count",                 :default => 0
    t.string   "unit",        :limit => 10, :default => "个",      :null => false
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

  create_table "post_infos", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "powers", :force => true do |t|
    t.integer  "user_id",                               :null => false
    t.integer  "system_function_id",                    :null => false
    t.boolean  "is_select",          :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settlement_lines", :force => true do |t|
    t.integer  "settlement_id",                                                               :null => false
    t.string   "type",          :limit => 50,                                                 :null => false
    t.string   "name",          :limit => 60,                                                 :null => false
    t.decimal  "value",                       :precision => 15, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settlements", :force => true do |t|
    t.integer  "org_id",                                                                              :null => false
    t.integer  "user_id"
    t.string   "mth",                   :limit => 6,                                                  :null => false
    t.boolean  "is_active",                                                         :default => true, :null => false
    t.decimal  "start_fee",                          :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "start_carrying_fee",                 :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "start_net_income",                   :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "start_radio",                        :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "start_push_money",                   :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "back_fee",                           :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "back_carrying_fee",                  :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "back_net_income",                    :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "back_radio",                         :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "back_push_money",                    :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "total_push_money",                   :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "total_subsidy",                      :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "total_deduction",                    :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "act_push_money",                     :precision => 15, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total_other_deduction",              :precision => 15, :scale => 2
  end

  create_table "system_functions", :force => true do |t|
    t.string   "group_name", :limit => 60,                   :null => false
    t.string   "func_name",  :limit => 60,                   :null => false
    t.string   "func_key",   :limit => 60,                   :null => false
    t.boolean  "is_active",                :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tk_infos", :force => true do |t|
    t.string   "tker_name",     :limit => 30,  :null => false
    t.date     "tk_date",                      :null => false
    t.string   "identify_type", :limit => 30
    t.string   "identify_no",   :limit => 30
    t.string   "note",          :limit => 300
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :default => "",    :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                      :default => "",    :null => false
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.boolean  "is_active",                          :default => true,  :null => false
    t.string   "username",            :limit => 30,                     :null => false
    t.integer  "org_id"
    t.boolean  "is_admin",                           :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vip_configs", :force => true do |t|
    t.integer  "org_id",                                                                   :null => false
    t.string   "name",       :limit => 60,                                                 :null => false
    t.decimal  "fee_from",                 :precision => 15, :scale => 2, :default => 0.0
    t.decimal  "fee_to",                   :precision => 15, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vip_fee_infos", :force => true do |t|
    t.integer  "org_id",                                                  :null => false
    t.string   "name",       :limit => 60,                                :null => false
    t.string   "phone",      :limit => 30
    t.string   "mth",        :limit => 6,                                 :null => false
    t.decimal  "fee",                      :precision => 15, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vip_infos", :force => true do |t|
    t.integer  "org_id",                                                                             :null => false
    t.string   "name",            :limit => 60,                                                      :null => false
    t.string   "phone",           :limit => 30
    t.decimal  "cur_fee",                       :precision => 15, :scale => 2, :default => 0.0
    t.string   "level",           :limit => 20,                                :default => "normal", :null => false
    t.string   "state",           :limit => 20,                                :default => "normal", :null => false
    t.string   "last_import_mth", :limit => 6,                                                       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "warehouses", :force => true do |t|
    t.string   "name",           :limit => 60,                    :null => false
    t.boolean  "is_active",                     :default => true, :null => false
    t.string   "note",           :limit => 200
    t.string   "manager",        :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "warehouse_type", :limit => 20
  end

end
