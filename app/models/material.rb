class Material < ActiveRecord::Base
  validates_presence_of :name,:message => "物品名称不可为空"
  validates_presence_of :unit,:message => "计量单位不可为空"
  validates_numericality_of :min_count,  :message => "最低库存应为数字"
  #定义物品信息的after_create
  #向storage(库存表)中插入相应的物品信息
  def after_save
    update_storage
  end
  def after_update
    update_storage
  end

  private 
  #更新库存记录
  def update_storage
    Warehouse.all.each do |w|
      #查找是否存在对应物品的库存记录
      storages = MStorage.warehouse_id_is(w).material_id_is(self)
      if storages.blank?
        the_storage = MStorage.new(:warehouse => w,:material => self )
        the_storage.save
      end
    end

  end

end
