module BillsHelper
  #选择付款方式
  def payType_for_select
    Bill.pay_types.collect {|key,value| [value,key]}
  end
  #得到付款方式选择
  def payType_display(pay_type)
    Bill.pay_types[pay_type]
  end
  #选择付款方式
  def billType_for_select
    CarryingBill.types.collect {|key,value| [value,key]}
  end
  #得到付款方式选择
  def billType_display(type)
    CarryingBill.types[type]
  end

  #单据状态
  def bill_state_for_select
    CarryingBill.states.collect {|key,value| [value,key]}
  end
  #入库单据状态
  def inout_bill_state_for_select
    InoutBill.states.collect {|key,value| [value,key]}
  end

  #单据状态的描述
  def bill_state_display(state_code)
    (CarryingBill.states.merge(InoutBill.states))[state_code]
  end  
  #根据单据状态及当前所在界面判断是否显示票据选择按钮
  #cur_page 当前界面
  #bill 单据对象
  def show_select_checkbox(cur_page,bill)
    #当前在票据确认界面
    ((cur_page.include?('index_confirm') && bill.state == Bill::STATE_DRAFT)|| \
     (cur_page.include?('index_post') && \
      (bill.state == CarryingBill::STATE_TK || bill.state == InoutBill::STATE_DELIVER || bill.state == InoutBill::STATE_CLEAR)))?false:true 
  end
end
