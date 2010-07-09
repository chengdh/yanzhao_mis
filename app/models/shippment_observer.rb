class ShippmentObserver < ActiveRecord::Observer
  observe :durable_shippment,:consumer_shippment
  #出货处理完毕后,物品的库存
  def after_save(shippment)
    shippment.material_inout_lines.each do |line|
      m_storage = MStorage.warehouse_id_is(shippment.warehouse).material_id_is(line.material).first
      #更新库存
      #FIXME 检查出库库存是否足够
      if line.qty > m_storage.qty 
        return false
      end
      m_storage.qty -= line.qty
      m_storage.save
    end
  end

end
