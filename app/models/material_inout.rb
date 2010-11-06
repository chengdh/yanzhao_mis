class MaterialInout < ActiveRecord::Base
  belongs_to :org
  belongs_to :warehouse
  #审核人
  belongs_to :auditor,:class_name => "User"
  #审核信息
  belongs_to :confirm

  has_many :material_inout_lines,:dependent => :destroy
  accepts_nested_attributes_for :material_inout_lines,:allow_destroy => true ,:reject_if => lambda{|attributes| attributes['material_id'].blank?}
  validates_presence_of :person_name,:message => "经办人不可为空!"
  validates_presence_of :inout_date,:message => "日期不可为空"
  #单据状态
  STATE_DRAFT = 'DR'    #草稿
  STATE_CONFIRM = 'CO'  #已确认
  #得到单据状态Hash
  def self.states
    {
      STATE_DRAFT => "草稿",
      STATE_CONFIRM => "已确认"
    }
  end
  #票据确认
  def confirm(user)
    if self.state == STATE_DRAFT
      self.build_confirm(:user => user)
      self.state = STATE_CONFIRM
      self.save
    end
  end

  #检查库存是否足够,在出库时使用
  protected
  def check_storage
    self.material_inout_lines.each do |line|
      m_storage = MStorage.warehouse_id_is(self.warehouse).material_id_is(line.material).first
      #检查出库库存是否足够
      if line.qty > m_storage.qty 
        self.errors.add(:material_inout_lines,"#{line.material.name}:当前库存不足!")
      end
    end
  end

end
