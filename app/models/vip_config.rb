#VIP 费用金额设置
class VipConfig < ActiveRecord::Base
  belongs_to :org
  VIP_DIAMOND = 'level_99'  #钻石
  VIP_GOLD = 'level_88'   #黄金
  VIP_SLIVER = 'level_66'  #白银
  VIP_NORMAL = 'level_11'  #普通
  #设置level描述
 def self.levels
   ordered_hash = ActiveSupport::OrderedHash.new
   ordered_hash[VIP_DIAMOND] = "钻石"
   ordered_hash[VIP_GOLD] = "金卡"
   ordered_hash[VIP_SLIVER] = "银卡"
   ordered_hash[VIP_NORMAL] = "普通卡"
   ordered_hash
 end
  #设置系统默认的分级金额范围
  def self.system_level_range(level)
    if level == VIP_NORMAL
      (0..1000)
    elsif level == VIP_SLIVER
      (1000..5000) 
    elsif       level == VIP_GOLD
      (5000..10000)
    elsif level == VIP_DIAMOND
      (10000..999999999) 
    end
  end
  #根据金额和org_id获取所属级别
  def self.get_level(org_id,fee)
    #自数据库中获取
    vip_configs = VipConfig.org_id_is(org_id)
    if !vip_configs.blank?
      diamond_range = VipConfig.org_id_is(org_id).name_is(VIP_DIAMOND).first
      gold_range = VipConfig.org_id_is(org_id).name_is(VIP_GOLD).first
      sliver_range = VipConfig.org_id_is(org_id).name_is(VIP_SLIVER).first
      normal_range = VipConfig.org_id_is(org_id).name_is(VIP_NORMAL).first
      if (diamond_range.fee_from..diamond_range.fee_to).include?(fee)
        VIP_DIAMOND
      elsif (gold_range.fee_from..gold_range.fee_to).include?(fee)
        VIP_GOLD
      elsif (sliver_range.fee_from..sliver_range.fee_to).include?(fee)
        VIP_SLIVER
      elsif (normal_range.fee_from..normal_range.fee_to).include?(fee)
        VIP_NORMAL 
      end
    else
      if self.system_level_range(VIP_DIAMOND).include?(fee)
        VIP_DIAMOND
      elsif self.system_level_range(VIP_GOLD).include?(fee)
        VIP_GOLD
      elsif self.system_level_range(VIP_SLIVER).include?(fee)
        VIP_SLIVER
      elsif self.system_level_range(VIP_NORMAL).include?(fee)
        VIP_NORMAL
      end
    end
  end
end
