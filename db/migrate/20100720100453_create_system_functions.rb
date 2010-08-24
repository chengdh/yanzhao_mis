#系统功能表
class CreateSystemFunctions < ActiveRecord::Migration
  def self.up
    create_table :system_functions do |t|
      t.string :group_name,:null => false,:limit => 60
      t.string :func_name,:null => false,:limit => 60
      t.string :func_key,:null => false,:limit => 60
      t.boolean :is_active,:null => false,:default => true

      t.timestamps
    end
    #以下初始化数据

    #公共信息
    SystemFunction.create :group_name => "公共信息",:func_name => "新建通知公告",:func_key => "new_notice"
    SystemFunction.create :group_name => "公共信息",:func_name => "通知公告审核",:func_key => "publish_notice"

    SystemFunction.create :group_name => "公共信息",:func_name => "新建规章制度",:func_key => "new_rule"
    SystemFunction.create :group_name => "公共信息",:func_name => "规章制度审核",:func_key => "publish_rule"

    SystemFunction.create :group_name => "公共信息",:func_name => "新建通讯录",:func_key => "new_address_book"
    SystemFunction.create :group_name => "公共信息",:func_name => "修改通讯录",:func_key => "edit_address_book"
    SystemFunction.create :group_name => "公共信息",:func_name => "删除通讯录",:func_key => "destroy_address_book"

    #贵宾系统

    SystemFunction.create :group_name => "贵宾系统",:func_name => "VIP信息导入",:func_key => "upload_vip_files"
    SystemFunction.create :group_name => "贵宾系统",:func_name => "VIP信息列表",:func_key => "vip_infos"
    SystemFunction.create :group_name => "贵宾系统",:func_name => "VIP级别设置",:func_key => "vip_config"
    SystemFunction.create :group_name => "贵宾系统",:func_name => "删除VIP信息",:func_key => "remove_vip_infos"
    #分成结算
    
    SystemFunction.create :group_name => "分成结算",:func_name => "新建合同模板",:func_key => "new_contract"
    SystemFunction.create :group_name => "分成结算",:func_name => "修改合同模板",:func_key => "edit_contract"
    SystemFunction.create :group_name => "分成结算",:func_name => "删除合同模板",:func_key => "destroy_contract"
    SystemFunction.create :group_name => "分成结算",:func_name => "新建结算表",:func_key => "new_settlement"
    SystemFunction.create :group_name => "分成结算",:func_name => "修改结算表",:func_key => "edit_settlement"
    SystemFunction.create :group_name => "分成结算",:func_name => "删除结算表",:func_key => "destroy_settlement"
    
    #
    #耐用品管理

    SystemFunction.create :group_name => "耐用品管理",:func_name => "新建入库单",:func_key => "new_durable_receipt"
    SystemFunction.create :group_name => "耐用品管理",:func_name => "新建领用单",:func_key => "new_durable_shippment"
    SystemFunction.create :group_name => "耐用品管理",:func_name => "耐用物品定义",:func_key => "new_durable_material"
    SystemFunction.create :group_name => "耐用品管理",:func_name => "库存查询",:func_key => "m_storages"
    SystemFunction.create :group_name => "耐用品管理",:func_name => "耐用品报废",:func_key => "new_scrapped_info"
    SystemFunction.create :group_name => "耐用品管理",:func_name => "部门耐用品汇总",:func_key => "material_inout_lines"
    #
    #
    #易耗品管理
    SystemFunction.create :group_name => "易耗品管理",:func_name => "新建入库单",:func_key => "new_consumer_receipt"
    SystemFunction.create :group_name => "易耗品管理",:func_name => "新建领用单",:func_key => "new_consumer_shippment"
    SystemFunction.create :group_name => "易耗品管理",:func_name => "耐用物品定义",:func_key => "new_consumer_material"
    SystemFunction.create :group_name => "易耗品管理",:func_name => "易耗品库存查询",:func_key => "consumer_m_storages"

    #
    #票据管理

    SystemFunction.create :group_name => "票据管理",:func_name => "新建票据",:func_key => "new_carrying_bill"
    SystemFunction.create :group_name => "票据管理",:func_name => "修改票据",:func_key => "edit_carrying_bill"
    SystemFunction.create :group_name => "票据管理",:func_name => "删除票据",:func_key => "destroy_carrying_bill"
    SystemFunction.create :group_name => "票据管理",:func_name => "票据确认",:func_key => "new_confirm"
    SystemFunction.create :group_name => "票据管理",:func_name => "提款处理",:func_key => "new_tk_info"
    SystemFunction.create :group_name => "票据管理",:func_name => "票据核销",:func_key => "new_post_info_carrying_bill"
    #
    #提货单管理
    SystemFunction.create :group_name => "提货单管理",:func_name => "新建票据",:func_key => "new_inout_bill"

    SystemFunction.create :group_name => "提货单管理",:func_name => "修改票据",:func_key => "edit_inout_bill"

    SystemFunction.create :group_name => "提货单管理",:func_name => "删除票据",:func_key => "destroy_inout_bill"
    SystemFunction.create :group_name => "提货单管理",:func_name => "票据确认",:func_key => "new_confirm_inout_bill"
    SystemFunction.create :group_name => "提货单管理",:func_name => "提货处理",:func_key => "new_deliver"
    SystemFunction.create :group_name => "提货单管理",:func_name => "清仓处理",:func_key => "new_clear_info"
    SystemFunction.create :group_name => "提货单管理",:func_name => "票据核销",:func_key => "new_post_info_inout_bill"

    #
    #以下为admin管理
    #基础资料管理
    #
    #
    #注册信息管理
    #
    #
    #
    #用户管理
  end

  def self.down
    drop_table :system_functions
  end
end
