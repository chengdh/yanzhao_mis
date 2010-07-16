class MaterialInout < ActiveRecord::Base
  belongs_to :org
  belongs_to :warehouse
  has_many :material_inout_lines,:dependent => :destroy
  accepts_nested_attributes_for :material_inout_lines,:allow_destroy => true ,:reject_if => lambda{|attributes| attributes['material_id'].blank?}
  validates_presence_of :person_name,:message => "经办人不可为空!"
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
