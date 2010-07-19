class ConfigInfo < ActiveRecord::Base
  validates_numericality_of :config_value_num,  :message => "应为数字"
  validates_numericality_of :config_num_from,  :message => "应为数字"
  validates_numericality_of :config_num_to,  :message => "应为数字"
  #以下定义系统配置中不同配置项的键值
  #仓储费费率
  KEY_STORAGE_FEE_RATE = "key_storage_fee_rate"; 
  #手续费费率键值
  KEY_HAND_FEE_RATE = "key_hand_fee_rate"
  #强制查询时间区间
  KEY_QUERY_DATE_RANGE = "key_query_date_range"
  named_scope :storage_fee_rate,:conditions => {:config_key => KEY_STORAGE_FEE_RATE},:order => "created_at DESC"
  named_scope :hand_fee_rates,:conditions => {:config_key => KEY_HAND_FEE_RATE},:order => "created_at DESC"
  named_scope :force_query_range,:conditions => {:config_key => KEY_QUERY_DATE_RANGE},:order => "created_at DESC"
  named_scope :user_query_range,lambda {|user_id| {:conditions => ["config_key = '#{KEY_QUERY_DATE_RANGE}' AND user_id = ?", user_id],:order => "created_at DESC" }}
  belongs_to :user

  #得到手续费区间数组,如果没有设置,返回默认值
  def self.get_hand_fee_a
    ret = []
    self.hand_fee_rates.each do |fee_rate|
      ret += [[(fee_rate.config_num_from..fee_rate.config_num_to),fee_rate.config_value_num]] 
    end
    ret
  end
  #得到默认的手续费设置
  #业务需求中
  #<1000    1.0元
  #1001 ～ 2000 2.0元
  #...依次类推
  def self.get_default_hand_fee(goods_fee)
    q,r = goods_fee.divmod(1000.0)
    if r > 0
      q+1
    else
      q
    end
  end

  #根据传入的货款计算手续费
  def self.cal_hand_fee(goods_fee)
    #默认在设置中未找到
    found = false
    ret = 0
    get_hand_fee_a.each do |fee_rate|
      if fee_rate[0].include? goods_fee
        found = true
        ret = fee_rate[1]
      end
    end
    ret = get_default_hand_fee(goods_fee) if !found
    ret
  end
  #得到仓储保管费费率,如果没有设置,返回默认值
  def self.get_storage_fee_rate
    ret = self.storage_fee_rate
    if !ret.blank?
      ret.first.config_value_num
    else
      #为空时默认为3元/天.件
      3
    end
  end
  #得到设置得强制票据查询期间
  def self.get_query_range(user_id)
    ret = self.user_query_range(user_id)
    if !ret.blank?
      [ret.first.config_date_from.blank? ? Time.now.years_ago(10).beginning_of_day : ret.first.config_date_from , \
        ret.first.config_date_to.blank? ? Time.now.years_since(10).beginning_of_day : ret.first.config_date_to]
    else
      [Time.now.years_ago(10).beginning_of_day,Time.now.years_since(10).beginning_of_day]
    end
  end
end
