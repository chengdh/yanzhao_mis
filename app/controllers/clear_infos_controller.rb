class ClearInfosController < BillOperateController
  protected
  #根据当前操作的类型得到操作后票据的状态,在子类中覆盖
  def after_state
    InoutBill::STATE_CLEAR
  end 
end
