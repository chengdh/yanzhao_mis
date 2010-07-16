class ShippmentObserver < ActiveRecord::Observer
  observe :durable_shippment,:consumer_shippment

  #出货处理完毕后,物品的库存
  def after_save(shippment)
    shippment.material_inout_lines.each do |line|
      m_storage = MStorage.warehouse_id_is(shippment.warehouse).material_id_is(line.material).first
      #更新库存
      m_storage.qty -= line.qty
      #设置库存报警
      m_storage.alert = (line.material.min_count > 0 && m_storage.qty <= line.material.min_count) ? true : false
      m_storage.save
    end
  end
end
