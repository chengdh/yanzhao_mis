class InoutBill < Bill 
  belongs_to :deliver
  belongs_to :clear_info
  self.add_validate


  #单据状态常数
  STATE_DELIVER='TH'       #已提货物
  STATE_CLEAR = 'CR'  #已清仓
  #得到单据状态Hash
  def self.states
    {
      STATE_DRAFT => "草稿",
      STATE_CONFIRM => "已确认",
      STATE_DELIVER => '已提货',       #已提货物
      STATE_CLEAR => '已清仓',  #已清仓
      STATE_POST => "已核销"
    }
  end

  #计算仓储费用
  def cal_fee!
    dur_days = (Date.today - inout_date.to_date).to_i
    ret = self[:goods_num]*dur_days*ConfigInfo.get_storage_fee_rate
    self[:storage_fee]=ret
  end
  #导出时需要用到的属性
  def state_des
    InoutBill.states[state]
  end
end
