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
  named_scope :all_bills,lambda { |user_id,*args|
    query_date_range = ConfigInfo.get_query_range(user_id)
    if !args.blank? && (!args.first.blank? || !args.second.blank?)
      tmp_from = !args.first.blank? ? args.first.to_datetime : 10.years.ago.beginnning_of_day
      tmp_to = !args.second.blank? ? args.second.to_datetime : 10.years.since.beginning_of_day
      tmp_from =  tmp_from.beginning_of_day.between?(query_date_range[0],query_date_range[1]) ? tmp_from : query_date_range[0]
      tmp_to = tmp_to.beginning_of_day.between?(query_date_range[0],query_date_range[1]) ? tmp_to : query_date_range[1]
      {:conditions => ["bills.created_at >= ? AND bills.created_at <= ?"] + [tmp_from,tmp_to.end_of_day],
        :order => "bills.created_at DESC,bills.bill_mth DESC,bills.goods_no"}
    else
      {:conditions => ["bills.created_at >= ? AND bills.created_at <= ?"] + query_date_range,
        :order => "bills.created_at DESC,bills.bill_mth DESC,bills.goods_no"}
    end
  }
  #按照票据号精确查询
  named_scope :bill_no_bill,lambda { |bill_no|  !bill_no.blank? ? {:conditions => {:bill_no => bill_no }}:{:conditions => ["1=2"]}}
  #不包含草稿的数据
  named_scope :not_draft, :conditions => ["state <> ?",STATE_DRAFT]
  named_scope :mth_bills, lambda { |mth|  !mth.blank? ? {:conditions => {:bill_mth => mth }}:{:conditions => {}}}
  named_scope :from_org_bills, lambda { |org_id| org_id.blank? ? {:conditions => {}}:{:conditions => {:from_org_id => org_id }}}
  named_scope :to_org_bills, lambda { |org_id| org_id.blank? ? {:conditions => {}}: {:conditions => {:to_org_id => org_id }}}
  named_scope :keyword_bills,lambda{ |keyword|
    keyword.blank? ? {:conditions => {}}:{:conditions => ["bill_no LIKE ? OR goods_no Like ? OR sender_name LIKE ? OR receiver_name LIKE ? OR goods_info LIKE ?","%#{keyword}%","%#{keyword}%","%#{keyword}%","%#{keyword}%","%#{keyword}%"]}
    }
    named_scope :state_bills, lambda { |state| state.blank? ? {:conditions => {}}:{:conditions => {:state => state }}}
    named_scope :paytype_bills, lambda { |pay_type|  pay_type.blank? ? {:conditions => {}}:{:conditions => {:pay_type => pay_type }}}
    #按照核销日期查询
    named_scope :post_bills,lambda { |*args|
      if !args.blank? && (!args.first.blank? || !args.second.blank?) 
        tmp_from = !args.first.blank? ? args.first.to_datetime : 10.years.ago.beginning_of_day
        tmp_to = !args.second.blank? ? args.second.to_datetime : 10.years.since.beginning_of_day
        {:conditions => ["post_infos.created_at >= ? AND post_infos.created_at <= ?"] + [tmp_from,tmp_to.end_of_day],:joins => :post_info }
      else
        {:conditions => {}}
      end

    }

    #综合查询
    def self.query(user_id,*arg)
      if !arg.blank? && !arg.first.blank?
        params = arg.first
        self.all_bills(user_id,params[:from_created],params[:to_created]).mth_bills(params[:bill_mth])\
          .from_org_bills(params[:from_org_id]).to_org_bills(params[:to_org_id]) \
          .keyword_bills(params[:keyword]).state_bills(params[:state]).paytype_bills(params[:pay_type])\
          .post_bills(params[:from_post_date],params[:to_post_date]).type_bills(params[:bill_type])
      else
        self.all_bills(user_id)
      end
    end

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
