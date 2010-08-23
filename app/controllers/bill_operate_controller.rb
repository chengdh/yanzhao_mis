class BillOperateController < BaseController
  def index
    #加入DISTINCT为了消除重复数据
    @bill_operates = @search.paginate :select =>"DISTINCT #{@param_name.tableize}.*",:page => params[:page],:order => "created_at DESC"
    instance_variable_set("@#{@param_name.tableize}",@bill_operate)
  end

  # GET /@bill_operates/new
  # GET /@bill_operates/new.xml
  def new
    bill_operate = @model_klazz.new()
    instance_variable_set("@#{@param_name}",bill_operate)
    #当传入运单id创建提款信息时
    if !params[:bill_id].blank?
      lines = bill_operate.send(@bill_type)

      the_bill =Object.const_get(@bill_type.classify).find(params[:bill_id])
      #只在提款或提货时计算费用
      the_bill.cal_fee! if [CarryingBill::STATE_TK,InoutBill::STATE_DELIVER].include?(after_state)
      lines<<the_bill
    end
    respond_to do |format|
      format.html { render :partial => "form",:object => bill_operate}
      format.xml  { render :xml => bill_operate }
    end
  end

  # POST /@bill_operates
  # POST /@bill_operates.xml
  def create
    bill_operate = @model_klazz.new(params[@param_name])
    instance_variable_set("@#{@param_name}",bill_operate)
    #设置当前操作员
    bill_operate.user = current_user
    #票据明细
    lines =[]
    #得到前台传入的票据id数组,并进行操作
    if !params[:bills].blank? 
      bills = Bill.find(params[:bills])
      lines = bill_operate.bills
      #设置票据状态为已提款
      bills.each_with_index do |bill,index| 
        #只在提款或提货时计算费用
        bill.cal_fee! if [CarryingBill::STATE_TK,InoutBill::STATE_DELIVER].include?(after_state)
        #清仓处理,运费及代收货款被清零
        bill.fee,bill.goods_fee = 0,0 if [InoutBill::STATE_CLEAR].include?(after_state)

        #如果清仓费用不为空
        bill.clear_fee = params[:clear_fee][index] if !params[:clear_fee].blank?
        bill.state = after_state
      end
      lines << bills
    end
    respond_to do |format|
      #如果没有选择票据进行处理,则返回表单界面,并显示错误
      if lines.blank? 
        flash[:error] = "您当前没有选择任何票据."
        format.html { render :partial => 'share/faile_save.rjs',:object => bill_operate} 
        format.xml  { render :xml => bill_operate.errors, :status => :unprocessable_entity }
        format.js { render :partial => 'share/faile_save.rjs',:object => bill_operate} 
      elsif bill_operate.save
        flash[:notice] = "共有#{lines.size}张票据成功进行了处理." 
        format.html { redirect_to :back }
        format.xml  { render :xml => bill_operate, :status => :created, :location => bill_operate }
        format.js  do
          render :update do |page|
            page.redirect_to :back
          end
        end
      else
        flash[:error] = "票据处理失败." 
        format.html { render :partial => 'share/faile_save.rjs',:object => bill_operate} 
        format.xml  { render :xml => bill_operate.errors, :status => :unprocessable_entity }
        format.js { render :partial => 'share/faile_save.rjs',:object => bill_operate} 
      end
    end
  end
  #根据当前操作的类型得到操作后票据的状态,在子类中覆盖
  def after_state
    Bill::STATE_DRAFT
  end 
end
