class Warehouse < ActiveRecord::Base
  validates_presence_of :name,:message => "名称不可为空"
  #after_create callback 建立仓库信息后,向storages中插入库存信息
  def after_create
    Material.all.each do |m|
      #查找是否存在对应物品的库存记录
      storages = MStorage.warehouse_id_is(self).material_id_is(m)
      if storages.blank?
        the_storage = MStorage.new(:warehouse => self,:material => m )
        the_storage.save
      end

    end
  end
end
