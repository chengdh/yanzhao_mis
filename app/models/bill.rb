class Bill < ActiveRecord::Base
  belongs_to :confirm
  belongs_to :post_info
  belongs_to :user
  belongs_to :from_org,:class_name => "SubCompany"
  belongs_to :to_org,:class_name => "SubCompany"


  #单据状态常数,不包括提款票据与提货票据特有的状态
  STATE_DRAFT = 'DR'  #草案
  STATE_CONFIRM = 'CO'#已确认
  STATE_POST='PO'     #已核销

  #付款方式常数
  PAYTYPE_CASH = 'CA'   #现金付款
  PAYTYPE_TH ='AP'      #提货付
  PAYTYPE_HZ = 'BP'     #回执付
  PAYTYPE_KP = 'KP'     #自货款扣除
  PAYTYPE_MP = 'MP'     #月结
  def self.pay_types
    {
      PAYTYPE_CASH => '现金付',   #现金付款
      PAYTYPE_TH => '提货付'  ,   #提货付
      PAYTYPE_HZ => '回执付'  ,   #回执付
      PAYTYPE_KP => '自货款扣',     #自货款扣除
      PAYTYPE_MP => '月结'     #月结
    }

  end
  #导出选项
  def self.export_options
    {:methods => [:from_org_name,:to_org_name,:pay_type_des,:state_des,:created_date],
      :only => [:bill_no,:goods_no,:sender_name,:sender_phone,:receiver_name,:receiver_phone,
        :bill_mth,:fee,:goods_fee,:goods_num,:k_hand_fee,:k_carrying_fee,
        :act_pay_fee,:storage_fee,:clear_fee,:goods_info,:note]}
  end
  def self.add_validate
    validates_presence_of :bill_no,:message => "不可为空"
    validates_presence_of :goods_no,:message => "不可为空"
    validates_uniqueness_of :bill_no, :message => "已存在"
    validates_uniqueness_of :goods_no,:message => "已存在"

    validates_presence_of :sender_name,:message => "不可为空"
    validates_presence_of :receiver_name,:message => "不可为空"
    validates_numericality_of :fee,  :message => "应为数字"
    validates_numericality_of :goods_fee,  :message => "应为数字"
    validates_numericality_of :goods_num, :only_integer => true,:greater_than => 0, :message => "应大于0"
    validates_presence_of :bill_mth,:message => "不可为空"
  end
  #以下定义named_scope
  named_scope :all_bills,lambda { |user_id|
    query_date_range = ConfigInfo.get_query_range(user_id)
    {:conditions => ["bills.created_at >= ? AND bills.created_at <= ?"] + query_date_range,
      :order => "bills.created_at DESC,bills.bill_mth DESC,bills.goods_no"}
  }
  #以下定义导出时需要用到的属性
  def from_org_name
    from_org.name
  end
  def to_org_name
    to_org.name
  end
  def pay_type_des
    Bill.pay_types[pay_type]
  end
  def created_date
    created_at.strftime('%Y-%m-%d')
  end
  #根据给定的条件计算合计
  #返回一个hash数组,便于导出
  def self.calculate_sum(options ={})
    sum = [
      self.sum(:fee,options),
      self.sum(:goods_fee,options),
      self.sum(:goods_num,options),
      self.sum(:k_hand_fee,options),
      self.sum(:k_carrying_fee,options), 
      self.sum(:act_pay_fee,options),
      self.sum(:storage_fee,options),
      self.sum(:clear_fee,options)
    ] 
    empty_col = ["合计:"]
    6.times do |i|
      empty_col += [""]
    end
    empty_col + sum
  end
end
