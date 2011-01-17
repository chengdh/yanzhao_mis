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

  #计算费用,/扣手续费/扣运费/实付货款
  def cal_fee!
    #判断票据当前状态,如果
    self[:k_hand_fee]= ConfigInfo.cal_hand_fee(self[:goods_fee])
    #计算扣运费及实际付款
    if self[:pay_type] == PAYTYPE_KP
      self[:k_carrying_fee]= self[:fee]
    else
      self[:k_carrying_fee] = 0
    end
    self[:act_pay_fee]= self[:goods_fee] - self[:k_hand_fee] - self[:k_carrying_fee]
  end
  #导出时需要用到的属性
  def state_des
    CarryingBill.states[state]
  end
  #2010-6-15 客户要求保存时计算扣手续费/扣运费/实付货款
  def before_save
    self.cal_fee!
  end
end
