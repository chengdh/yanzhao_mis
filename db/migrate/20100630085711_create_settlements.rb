class CreateSettlements < ActiveRecord::Migration
  def self.up
    create_table :settlements do |t|
      t.references :org,:null => false
      t.references :user
      t.string :mth,:null => false,:limit => 6
      t.boolean :is_active,:null => false ,:default => true
      t.decimal :start_fee,:default => 0,:precision => 15,:scale => 2   #始发货营业收入
      t.decimal :start_carrying_fee,:default => 0,:precision => 15,:scale => 2 #始发货短途运费
      t.decimal :start_net_income,:default => 0,:precision => 15,:scale => 2  #始发货净收入
      t.decimal :start_radio,:default => 0,:precision => 15,:scale => 2       #始发货结算比例
      t.decimal :start_push_money,:default => 0,:precision => 15,:scale => 2 #始发货提成额
      t.decimal :back_fee,:default => 0,:precision => 15,:scale => 2 #返程货营业收入
      t.decimal :back_carrying_fee,:default => 0,:precision => 15,:scale => 2  #返程货短途运费
      t.decimal :back_net_income,:default => 0,:precision => 15,:scale => 2  #返程货净收入
      t.decimal :back_radio,:default => 0,:precision => 15,:scale => 2  #返程货结算比例
      t.decimal :back_push_money,:default => 0,:precision => 15,:scale => 2 #返程货提成额
      t.decimal :total_push_money,:default => 0,:precision => 15,:scale => 2 #总提成额
      t.decimal :total_subsidy,:default => 0,:precision => 15,:scale => 2  #应补小计
      t.decimal :total_deduction,:default => 0,:precision => 15,:scale => 2 #应扣小计
      t.decimal :act_push_money,:default => 0,:precision => 15,:scale => 2 #实际提成

      t.timestamps
    end
  end

  def self.down
    drop_table :settlements
  end
end
