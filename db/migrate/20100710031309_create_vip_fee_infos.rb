class CreateVipFeeInfos < ActiveRecord::Migration
  def self.up
    create_table :vip_fee_infos do |t|
      t.references :org,:null => false #所属机构
      t.string :name,:null => false,:limit => 60 #客户姓名
      t.string :phone,:limit => 30  #联系电话
      t.string :mth,:null => false,:limit => 6 #数据月份
      t.decimal :fee,:precision => 15,:scale => 2  #当月合计费用

      t.timestamps
    end
  end

  def self.down
    drop_table :vip_fee_infos
  end
end
