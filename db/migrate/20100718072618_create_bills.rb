class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.string :bill_no,:limit => 30,:null => false
      t.string :goods_no,:limit => 30
      t.string :bill_mth,:limit => 6,:null => false
      t.string :sender_name,:limit => 20,:null => false
      t.string :sender_phone
      t.string :receiver_name
      t.string :receiver_phone
      t.references :from_org,:null => false
      t.references :to_org,:null => false
      t.decimal :fee,:precision => 10,:scale => 2,:default => 0
      t.decimal :goods_fee,:precision => 10,:scale => 2,:default => 0
      t.integer :goods_num,:default => 0
      t.string :goods_info,:limit => 200
      t.date :bill_date
      t.string  :pay_type, :limit => 2,:null => false
      t.boolean :is_active, :default => true
      t.string :state, :limit => 2,:null => false,:default => 'DR'
      t.references :tk_info
      t.references :post_info
      t.decimal :k_hand_fee,:default => 0,:precision => 10,:scale => 2
      t.decimal :k_carrying_fee, :default => 0,:precision => 10,:scale => 2
      t.decimal :act_pay_fee,:default => 0,:precision => 10,:scale => 2
      #票据性质
      t.string  :bill_type,:limit => 2
      #入库日期,默认当前日期
      t.date  :inout_date
      #记录类型 提款运单/提货运单
      t.string :type,:limit => 60
      t.decimal :storage_fee,:default => 0,:precision => 10,:scale => 2
      t.decimal :clear_fee, :default => 0,:precision => 10,:scale => 2
      t.references  :user
      t.references :clear_info
      t.references :deliver
      t.references :confirm

      t.string :note, :limit => 255

      t.timestamps
    end
  end

  def self.down
    drop_table :bills
  end
end
