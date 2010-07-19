class ContractsController < BaseController
  def new
    #自前台页面选择的参数
    date_from = (params[:search].blank? || params[:search][:date_from].blank?) ? Date.today :  params[:search][:date_from]
    date_to = (params[:search].blank? || params[:search][:date_to].blank?) ? Date.today.months_since(12) :  params[:search][:date_to]
    org_id = params[:search][:org_id] if !params[:search].blank? && !params[:search][:org_id].blank? 
    @contract = Contract.new(:date_from => date_from,:date_to => date_to,:org_id => org_id)
    months = months_range(date_from.to_date,date_to.to_date)
    #创建各个月的分成比例
    months.keys.each { |mth|  @contract.contract_radios.build(:mth => mth )}
    #新建默认数量的项目
    months.keys.each { |mth| 5.times { @contract.fixed_subsidies.build(:mth => mth )}}
    months.keys.each { |mth| 5.times { @contract.fixed_deductions.build(:mth => mth )}}
    @group_fixed_subsidies = @contract.fixed_subsidies.group_by {|item| item.mth}
    @group_fixed_deductions = @contract.fixed_deductions.group_by {|item| item.mth}
    5.times {@contract.unfixed_deductions.build}
    5.times {@contract.unfixed_subsidies.build}
    10.times {@contract.other_deductions.build}
  end
  #取消报警标志
  #PUT contracts/:id/disable_alert
  def disable_alert
    @contract = Contract.find(params[:id])
    #FIXME 将alert标志设置为true说明已知道报警了
    flash[:notice] = "报警标志已取消!"
    @contract.update_attributes(:alert => true)
    redirect_to :back
  end
  def edit
    prepare_data
  end
  def show
    prepare_data
  end
  private 
  def prepare_data
    @contract = Contract.find(params[:id])
    @group_fixed_subsidies = @contract.fixed_subsidies.group_by {|item| item.mth}
    @group_fixed_deductions = @contract.fixed_deductions.group_by {|item| item.mth}
  end
  #根据起始和结束日期得到日期月份列表
  protected 
  def months_range(start_dt,end_dt)
    ret = ActiveSupport::OrderedHash.new
    0.upto(40) do |n|
      tmp = start_dt.months_since(n).to_date
      if tmp <= end_dt
        ret[tmp.strftime("%Y%m")] = tmp.strftime("%Y年%m月")
      end
    end
    ret
  end

end
