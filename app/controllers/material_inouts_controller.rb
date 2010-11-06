class MaterialInoutsController < BaseController
  def new
    bill = @model_klazz.new(:inout_date => Date.today)
    2.times {bill.material_inout_lines.build }
    instance_variable_set("@#{@param_name}",bill)
  end
  #票据确认操作
  def confirm
    inout_bill = @model_klazz.find(params[:id])
    inout_bill.confirm(current_user)
    flash[:notice] = '单据已成功确认.'
    redirect_to :back
  end
end
