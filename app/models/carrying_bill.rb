class CarryingBill < Bill
  belongs_to :tk_info
  #添加验证
  self.add_validate
  #单据状态常数
  STATE_TK='YT'       #已提款
  #得到单据状态Hash
  def self.states
    {
      STATE_DRAFT => "草稿",
      STATE_CONFIRM => "已确认",
      STATE_TK => "已提款",
      STATE_POST => "已核销"
    }
  end
  #票据性质常数
  TYPE_NCASH='NC'  #现金未取
  TYPE_NTRAN='NT'  #转帐失败
  def self.types
    {
      TYPE_NCASH => "现金未取",
      TYPE_NTRAN => "转帐失败"
    }
  end

  #提款日期区间查询
  named_scope :tk_bills,lambda { |*args|
    if !args.blank? && (!args.first.blank? || !args.second.blank?)
      tmp_from = !args.first.blank? ? args.first.to_datetime : 10.years.ago.beginning_of_day
      tmp_to = !args.second.blank? ? args.second.to_datetime : 10.years.since.beginning_of_day
      {:conditions => ["tk_infos.tk_date >= ? AND tk_infos.tk_date <= ?"] + [tmp_from.beginning_of_day,tmp_to.end_of_day],:joins => :tk_info }
    else
      {:conditions => {}}
    end
  }
  #票据类型查询
  named_scope :type_bills, lambda { |type| type.blank? ? {:conditions => {}}:{:conditions => {:bill_type => type }}}
  #综合查询
  def self.query(user_id,*arg)
    if !arg.blank? && !arg.first.blank?
      params = arg.first
      self.all_bills(user_id,params[:from_created],params[:to_created]).mth_bills(params[:bill_mth])\
        .from_org_bills(params[:from_org_id]).to_org_bills(params[:to_org_id]) \
        .keyword_bills(params[:keyword]).state_bills(params[:state]).paytype_bills(params[:pay_type])\
        .tk_bills(params[:from_tk_date],params[:to_tk_date]) \
        .post_bills(params[:from_post_date],params[:to_post_date]).type_bills(params[:bill_type])
    else
      self.all_bills(user_id)
    end
  end
  #计算费用,/扣手续费/扣运费/实付货款
  def cal_fee!
    #判断票据当前状态,如果
    self[:k_hand_fee]= ConfigInfo.cal_hand_fee(self[:goods_fee])
    #计算扣运费及实际付款
    if self[:pay_type] == PAYTYPE_KP
      self[:k_carrying_fee]= self[:fee]
    end
    self[:act_pay_fee]= self[:goods_fee] - self[:k_hand_fee] - self[:k_carrying_fee]
  end
  #导出时需要用到的属性
  def state_des
    CarryingBill.states[state]
  end
  #2010-6-15 客户要求保存时计算扣手续费/扣运费/实付货款
  #TODO 暂时注释
  #def before_save
  #  self.cal_fee!
  #end
end
