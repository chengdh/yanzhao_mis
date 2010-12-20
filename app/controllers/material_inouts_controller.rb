class MaterialInoutsController < BaseController
  def new
    bill = @model_klazz.new(:inout_date => Date.today)
    bill.org = current_user.org
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
  def show
    bill = @model_klazz.find(params[:id])
    instance_variable_set("@#{@param_name}",bill)

    respond_to do |format|
      format.html
      #导出数据
      format.csv  { send_data gen_export(bill)}
    end
  end
  private
  def gen_export(bill)
    header =["仓库:#{bill.warehouse.name}",'',"经办人:#{bill.person_name}",bill.org.blank? ? "" : "部门:#{bill.org.name}","日期:#{bill.created_at.strftime('%Y-%m-%d')}"] 
    sum = bill.material_inout_lines.sum(:line_amt)
    sum_arr = ['','','','合计:',sum]
    Array::BOM_HEADER + header.export_line_csv + bill.material_inout_lines.export_csv(MaterialInoutLine.export_options,false) + sum_arr.export_line_csv
  end
end
