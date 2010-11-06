module MaterialInoutsHelper
  def material_inout_states_for_select
    MaterialInout.states.collect {|key,value| [value,key]}
  end
  #是否显示票据审核连接
  def audit_link(inout_bill)
    if inout_bill.state == MaterialInout::STATE_DRAFT && inout_bill.auditor == current_user
      confirm_path = ""
      confirm_path = confirm_durable_receipt_path(inout_bill) if inout_bill.class == DurableReceipt
      confirm_path = confirm_durable_shippment_path(inout_bill) if inout_bill.class == DurableShippment
      confirm_path = confirm_consumer_receipt_path(inout_bill) if inout_bill.class == ConsumerReceipt
      confirm_path = confirm_consumer_shippment_path(inout_bill) if inout_bill.class == ConsumerShippment
      link_to "审核",confirm_path,:method => :put
    else
      ""
    end
  end
end
