class VipConfigsController < ApplicationController
  # GET /vip_configs
  # GET /vip_configs.xml
  def index
    @vip_configs = VipConfig.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vip_configs }
    end
  end

  # GET /vip_configs/1
  # GET /vip_configs/1.xml
  def show
    @vip_config = VipConfig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vip_config }
    end
  end

  # GET /vip_configs/new
  # GET /vip_configs/new.xml
  def new
    @vip_config = VipConfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vip_config }
    end
  end

  # GET /vip_configs/1/edit
  def edit
    @vip_config = VipConfig.find(params[:id])
  end

  # POST /vip_configs
  # POST /vip_configs.xml
  def create
    @vip_config = VipConfig.new(params[:vip_config])

    respond_to do |format|
      if @vip_config.save
        flash[:notice] = 'VipConfig was successfully created.'
        format.html { redirect_to(@vip_config) }
        format.xml  { render :xml => @vip_config, :status => :created, :location => @vip_config }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vip_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vip_configs/1
  # PUT /vip_configs/1.xml
  def update
    @vip_config = VipConfig.find(params[:id])

    respond_to do |format|
      if @vip_config.update_attributes(params[:vip_config])
        flash[:notice] = 'VipConfig was successfully updated.'
        format.html { redirect_to(@vip_config) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vip_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vip_configs/1
  # DELETE /vip_configs/1.xml
  def destroy
    @vip_config = VipConfig.find(params[:id])
    @vip_config.destroy

    respond_to do |format|
      format.html { redirect_to(vip_configs_url) }
      format.xml  { head :ok }
    end
  end
end
