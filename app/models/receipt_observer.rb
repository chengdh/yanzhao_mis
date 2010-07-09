class ReceiptObserver < ActiveRecord::Observer
  observe :durable_receipt,:consumer_receipt
  #收货处理完毕后,更新对应物品的库存和均价
  def after_save(receipt)
    receipt.material_inout_lines.each do |line|
      m_storage = MStorage.warehouse_id_is(receipt.warehouse).material_id_is(line.material).first
      #更新均价
      m_storage.avg_price = (m_storage.qty*m_storage.avg_price + line.price * line.qty)/(m_storage.qty + line.qty)
      #更新库存
      m_storage.qty += line.qty
      m_storage.save
    end
  end

end
