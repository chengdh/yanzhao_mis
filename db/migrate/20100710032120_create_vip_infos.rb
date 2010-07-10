#vip  客户信息表
class CreateVipInfos < ActiveRecord::Migration
  def self.up
    create_table :vip_infos do |t|
      t.references :org,:null => false   #贵宾客户所属机构
      t.string :name,:null => false,:limit => 60       #姓名
      t.string :phone,:limit => 30     #联系电话
      t.decimal :cur_fee,:default => 0 ,:precision => 15,:scale => 2   #当月费用
      t.string :level,:null => false,:limit => 20,:default => "normal"      #当前级别
      t.string :state,:null => false,:limit => 20,:default => "normal"      #当前状态,记录费用是否下降
      t.string :last_import_mth,:null => false,:limit => 6  #最后一次导入数据月份

      t.timestamps
    end
  end

  def self.down
    drop_table :vip_infos
  end
end
