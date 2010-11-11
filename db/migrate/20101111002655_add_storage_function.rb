#添加物品出入库单据的审核机信息发布审核功能
class AddStorageFunction < ActiveRecord::Migration
  def self.up
    func_1 = SystemFunction.create :group_name => "耐用品管理",:func_name => "入库单审核",:func_key => "durable_receipt_audit"
    func_2 = SystemFunction.create :group_name => "耐用品管理",:func_name => "领用单审核",:func_key => "durable_shippment_audit"

    func_3 = SystemFunction.create :group_name => "易耗品管理",:func_name => "入库单审核",:func_key => "consumer_receipt_audit"
    func_4 = SystemFunction.create :group_name => "易耗品管理",:func_name => "领用单审核",:func_key => "consumer_shippment_audit"

    #将新增加的功能添加到各个用户
    User.all.each do |u| 
      u.powers.create(:system_function => func_1)
      u.powers.create(:system_function => func_2)
      u.powers.create(:system_function => func_3)
      u.powers.create(:system_function => func_4)
    end

  end

  def self.down
  end
end
