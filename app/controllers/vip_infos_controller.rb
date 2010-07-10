class VipInfosController < ApplicationController
  # GET /vip_infos
  # GET /vip_infos.xml
  def index
    @vip_infos = VipInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vip_infos }
    end
  end

  # GET /vip_infos/1
  # GET /vip_infos/1.xml
  def show
    @vip_info = VipInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vip_info }
    end
  end

  # GET /vip_infos/new
  # GET /vip_infos/new.xml
  def new
    @vip_info = VipInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vip_info }
    end
  end

  # GET /vip_infos/1/edit
  def edit
    @vip_info = VipInfo.find(params[:id])
  end

  # POST /vip_infos
  # POST /vip_infos.xml
  def create
    @vip_info = VipInfo.new(params[:vip_info])

    respond_to do |format|
      if @vip_info.save
        flash[:notice] = 'VipInfo was successfully created.'
        format.html { redirect_to(@vip_info) }
        format.xml  { render :xml => @vip_info, :status => :created, :location => @vip_info }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vip_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vip_infos/1
  # PUT /vip_infos/1.xml
  def update
    @vip_info = VipInfo.find(params[:id])

    respond_to do |format|
      if @vip_info.update_attributes(params[:vip_info])
        flash[:notice] = 'VipInfo was successfully updated.'
        format.html { redirect_to(@vip_info) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vip_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vip_infos/1
  # DELETE /vip_infos/1.xml
  def destroy
    @vip_info = VipInfo.find(params[:id])
    @vip_info.destroy

    respond_to do |format|
      format.html { redirect_to(vip_infos_url) }
      format.xml  { head :ok }
    end
  end
end
