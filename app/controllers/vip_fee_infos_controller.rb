class VipFeeInfosController < ApplicationController
  # GET /vip_fee_infos
  # GET /vip_fee_infos.xml
  def index
    @vip_fee_infos = VipFeeInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vip_fee_infos }
    end
  end

  # GET /vip_fee_infos/1
  # GET /vip_fee_infos/1.xml
  def show
    @vip_fee_info = VipFeeInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vip_fee_info }
    end
  end

  # GET /vip_fee_infos/new
  # GET /vip_fee_infos/new.xml
  def new
    @vip_fee_info = VipFeeInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vip_fee_info }
    end
  end

  # GET /vip_fee_infos/1/edit
  def edit
    @vip_fee_info = VipFeeInfo.find(params[:id])
  end

  # POST /vip_fee_infos
  # POST /vip_fee_infos.xml
  def create
    @vip_fee_info = VipFeeInfo.new(params[:vip_fee_info])

    respond_to do |format|
      if @vip_fee_info.save
        flash[:notice] = 'VipFeeInfo was successfully created.'
        format.html { redirect_to(@vip_fee_info) }
        format.xml  { render :xml => @vip_fee_info, :status => :created, :location => @vip_fee_info }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vip_fee_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vip_fee_infos/1
  # PUT /vip_fee_infos/1.xml
  def update
    @vip_fee_info = VipFeeInfo.find(params[:id])

    respond_to do |format|
      if @vip_fee_info.update_attributes(params[:vip_fee_info])
        flash[:notice] = 'VipFeeInfo was successfully updated.'
        format.html { redirect_to(@vip_fee_info) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vip_fee_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vip_fee_infos/1
  # DELETE /vip_fee_infos/1.xml
  def destroy
    @vip_fee_info = VipFeeInfo.find(params[:id])
    @vip_fee_info.destroy

    respond_to do |format|
      format.html { redirect_to(vip_fee_infos_url) }
      format.xml  { head :ok }
    end
  end
end
