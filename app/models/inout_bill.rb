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

  #按照入库日期查询
  named_scope :in_date_bills,lambda { |*args|
    if !args.blank? &&(!args.first.blank? || !args.second.blank?)
      tmp_from = !args.first.blank? ? args.first.to_datetime : 10.years.ago.beginning_of_day
      tmp_to = !args.second.blank? ? args.second.to_datetime : 10.years.since.beginning_of_day
      {:conditions => ["bills.inout_date >= ? AND bills.inout_date <= ?"] + [tmp_from.beginning_of_day,tmp_to.end_of_day.end_of_day] }
    else
      {:conditions => {}}
    end
  }
  #提货日期区间查询
  named_scope :deliver_bills,lambda { |*args|
    if !args.blank? && (!args.first.blank? || !args.second.blank?)
      tmp_from = !args.first.blank? ? args.first.to_datetime : 10.years.ago.beginning_of_day
      tmp_to = !args.second.blank? ? args.second.to_datetime : 10.years.since.beginning_of_day
      {:conditions => ["delivers.deliver_date >= ? AND delivers.deliver_date <= ?"] + [tmp_from.beginning_of_day,tmp_to.end_of_day],:joins => :deliver }
    else
      {:conditions => {}}
    end
  }
  #清仓日期区间查询
  named_scope :clear_bills,lambda { |*args|
    if !args.blank? && (!args.first.blank? || !args.second.blank?)
      tmp_from = !args.first.blank? ? args.first.to_datetime : 10.years.ago.beginning_of_day
      tmp_to = !args.second.blank? ? args.second.to_datetime : 10.years.since.beginning_of_day
      {:conditions => ["clear_infos.clear_date >= ? AND clear_infos.clear_date <= ?"] + [tmp_from.beginning_of_day,tmp_to.end_of_day],:joins => :clear_info }
    else
      {:conditions => {}}
    end
  }
  #综合查询
  def self.query(user_id,*arg)
    if !arg.blank? && !arg.first.nil?
      params = arg.first
      all_bills(user_id,params[:from_created],params[:to_created]).mth_bills(params[:bill_mth]).from_org_bills(params[:from_org_id]).to_org_bills(params[:to_org_id]) \
        .keyword_bills(params[:keyword]).state_bills(params[:state]).paytype_bills(params[:pay_type])\
        .deliver_bills(params[:from_deliver_date],params[:to_deliver_date])\
        .clear_bills(params[:from_clear_date],params[:to_clear_date])\
        .post_bills(params[:from_post_date],params[:to_post_date])\
        .in_date_bills(params[:from_in_date],params[:to_in_date])
    else
      self.all_bills(user_id)
    end
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
