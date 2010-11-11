class BillsController < BaseController
  # GET /bills
  # GET /bills.xml
  def index
    @bills = @search.paginate :page => params[:page],:order => "created_at DESC"
    #单据选择时,缓存到客户端的id数组
    @bill_ids = @search.all(:select => "bills.id")

    #以下得到合计信息
    @sum_info = { 
      :count =>@search.count,
      :sum_fee => @search.sum(:fee),
      :sum_goods_fee => @search.sum(:goods_fee),
      :sum_goods_num => @search.sum(:goods_num),
      :sum_k_hand_fee => @search.sum(:k_hand_fee),
      :sum_k_carrying_fee => @search.sum(:k_carrying_fee),
      :sum_act_pay_fee => @search.sum(:act_pay_fee),
      :sum_storage_fee => @search.sum(:storage_fee),
      :sum_clear_fee => @search.sum(:clear_fee)
    } 
    respond_to do |format|
      #TODO 暂时注释
      #if @model_klazz.count > 0
      format.html do
        #以下根据页面标志确定输出页面
        params[:template] = params[:template].blank? ? "shared/bills/index" :  params[:template]
        #根据查询条件动态的指向输出的界面
        params[:template] = 'shared/bills/index_confirm' if !params[:search].blank? && !params[:search][:state_is].blank? && params[:search][:state_is] == Bill::STATE_DRAFT  
        params[:template] = 'shared/bills/index_post' if !params[:search].blank? && !params[:search][:state_is].blank? && (params[:search][:state_is] == CarryingBill::STATE_TK || params[:search][:state_is] ==  InoutBill::STATE_DELIVER || params[:search][:state_is] == InoutBill::STATE_CLEAR)
        
        render params[:template]
      end
      format.xml  { render :xml => @bills }
      #ajax翻页时的处理
      format.js { render :partial => "shared/bills/bill_list",:object => {:bills =>  @bills,:show_select => true,:remote_paginate => true,:show_sum => true }}
      format.csv do 
        if !params[:confirm_id].blank? 
          send_data @model_klazz.all(:conditions => ["confirm_id = ?",params[:confirm_id]]).export_csv(Bill.export_options) + 
            @model_klazz.calculate_sum(:conditions => ["confirm_id = ?",params[:confirm_id]]).export_line_csv
        elsif !params[:post_info_id].blank?
          send_data @model_klazz.all(:conditions => ["post_info_id = ?",params[:post_info_id]]).export_csv(Bill.export_options) + 
            @model_klazz.calculate_sum(:conditions => ["post_info_id = ?",params[:post_info_id]]).export_line_csv
        else
          sum = [@sum_info[:sum_fee],@sum_info[:sum_goods_fee],@sum_info[:sum_goods_num],
            @sum_info[:sum_k_hand_fee],@sum_info[:sum_k_carrying_fee],@sum_info[:sum_act_pay_fee],
            @sum_info[:sum_storage_fee],@sum_info[:sum_clear_fee]]
          empty_col = ["合计:"]
          6.times do |i|
            empty_col += [""]
          end
          sum = empty_col + sum
          send_data @search.all.export_csv(Bill.export_options) + sum.export_line_csv
        end
      end 
      #else
      #  format.html { render :template => "shared/bills/empty"} 
      #end
    end
  end

  # GET /bills/1
  # GET /bills/1.xml
  def show
    bill = @model_klazz.find(params[:id])

    instance_variable_set("@#{@param_name}",bill)
    respond_to do |format|
      format.html { render :partial => "shared/bills/bill_readonly",:object => bill} 
      format.xml  { render :xml => bill }
    end
  end

  # GET /bills/new
  # GET /bills/new.xml
  def new
    #票据月份默认为当月月份
    bill = @model_klazz.new(:goods_num => 1,:bill_mth => Date.today.strftime("%Y%m"),:inout_date => Date.today)
    instance_variable_set("@#{@param_name}",bill)
    respond_to do |format|
      format.html { render :template => 'shared/bills/new',:locals => {:bill => bill }}
      format.xml  { render :xml => bill }
    end
  end

  # GET /bills/1/edit
  def edit
    bill = @model_klazz.find(params[:id])
    instance_variable_set("@#{@param_name}",bill)
    respond_to do |format|
      format.html { render :template => 'shared/bills/new',:locals => {:bill => bill} }
    end
  end

  # POST /bills
  # POST /bills.xml
  def create
    bill = @model_klazz.new(params[@param_name])
    bill.user = current_user
    instance_variable_set("@#{@param_name}",bill)
    respond_to do |format|
      if bill.save
        flash[:notice] = "票据信息保存成功."
        format.html { redirect_to :action => :index }
        format.xml  { render :xml => bill, :status => :created, :location => bill }
      else
        flash[:error] = "票据保存失败."
        format.html { render :template => 'shared/bills/new',:bill => bill} 
        format.xml  { render :xml => bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bills/1
  # PUT /bills/1.xml
  def update
    bill = @model_klazz.find(params[:id])

    respond_to do |format|
      if bill.update_attributes(params[@param_name])
        flash[:notice] = "票据信息更新成功."
        format.html { redirect_to :action => :index }
      else
        flash[:error] = "票据更新失败."
        format.html { render :template => 'shared/bills/new',:bill => bill} 
        format.xml  { render :xml => bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.xml
  def destroy

    bill = @model_klazz.find(params[:id])
    bill.destroy

    flash[:notice] = "票据#{bill.bill_no}已被成功删除."
    respond_to do |format|
      format.html { redirect_to  :back}
      format.xml  { head :ok }
    end
  end
  # get /bills/:id/select
  # 单据选择,选择一张单据
  def select
    bill = @model_klazz.find(params[:id])

    is_select = params[:is_select]
    respond_to do |format|
      format.js  { render :json =>[bill , is_select],:callback => "selector.select_bill" }
    end
  end

  #根据票号查询单张票据,并进行一些处理
  #GET /bills/search.js
  def search
    bills = @search.all
    respond_to do |format|
      format.js   do
        if !bills.blank? 
          #callback 指向页面的处理逻辑
          #计算相关费用
          #只在提款或提货时计算费用
          bills.first.cal_fee! if ['tk_info','deliver'].include?(params[:operate])
          #清仓处理,运费及代收货款被清零
          bills.first.fee,bills.first.goods_fee = 0,0 if ['clear_info'].include?(params[:operate])
          render :json => [bills.first,params[:operate]],:callback => 'billOperateUtil.addBill' 
        else
          render :text => "未查询到指定票据(或者票据未确认?)",:status => :bad_request 
        end
      end
    end
  end
  #生成@search对象
  def create_search
    if current_user.is_admin
      @search = @model_klazz.search(params[:search])
    else
      @search = @model_klazz.all_bills(current_user).search(params[:search])
    end
  end

end
