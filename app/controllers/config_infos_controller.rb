class ConfigInfosController < BaseController

  # GET /config_infos/new
  # GET /config_infos/new.xml
  def new
    @config_info = ConfigInfo.new(params[:config_info])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @config_info }
      format.js do
        render :partial => "form_storage_fee" if params[:config_info][:config_key] == ConfigInfo::KEY_STORAGE_FEE_RATE
        render :partial => "form_hand_fee_rate" if params[:config_info][:config_key] == ConfigInfo::KEY_HAND_FEE_RATE
        render :partial => "form_query_date_range" if params[:config_info][:config_key] == ConfigInfo::KEY_QUERY_DATE_RANGE
      end
    end
  end

  # GET /config_infos/1/edit
  def edit
    @config_info = ConfigInfo.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @config_info }
      format.js do
        render :partial => "form_storage_fee" if @config_info.config_key == ConfigInfo::KEY_STORAGE_FEE_RATE
        render :partial => "form_hand_fee_rate" if @config_info.config_key == ConfigInfo::KEY_HAND_FEE_RATE
        render :partial => "form_query_date_range" if @config_info.config_key == ConfigInfo::KEY_QUERY_DATE_RANGE
      end
    end
  end

  # POST /config_infos
  # POST /config_infos.xml
  def create
    @config_info = ConfigInfo.new(params[:config_info])

    respond_to do |format|
      if @config_info.save
        flash[:notice] = "<div class='success'>配置信息创建成功.</div>"
        format.html { render :partial => "list_hand_fee",:object => hand_fee_rates }
        format.xml  { render :xml => @config_info, :status => :created, :location => @config_info }
        format.js   do 
          if @config_info.config_key == ConfigInfo::KEY_HAND_FEE_RATE
            render :partial => "success_save.rjs",:object => ConfigInfo.hand_fee_rates
          elsif @config_info.config_key == ConfigInfo::KEY_QUERY_DATE_RANGE
            render :partial => "success_save.rjs",:object => ConfigInfo.force_query_range
          else
            render :partial => "success_save.rjs",:object => @config_info
          end
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @config_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /config_infos/1
  # PUT /config_infos/1.xml
  def update
    @config_info = ConfigInfo.find(params[:id])
    hand_fee_rates = ConfigInfo.hand_fee_rates
    respond_to do |format|
      if @config_info.update_attributes(params[:config_info])
        flash[:notice] = "<div class='success'>配置信息更新成功.</div>"
        format.html { redirect_to(@config_info) }
        format.xml  { head :ok }
        format.js   do 
          if @config_info.config_key == ConfigInfo::KEY_HAND_FEE_RATE
            render :partial => "success_save.rjs",:object => ConfigInfo.hand_fee_rates
          elsif @config_info.config_key == ConfigInfo::KEY_QUERY_DATE_RANGE
            render :partial => "success_save.rjs",:object => ConfigInfo.force_query_range
          else
            render :partial => "success_save.rjs",:object => @config_info
          end
        end

      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @config_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /config_infos/1
  # DELETE /config_infos/1.xml
  def destroy
    @config_info = ConfigInfo.find(params[:id])
    @config_info.destroy
    hand_fee_rates = ConfigInfo.hand_fee_rates
    respond_to do |format|
      format.html { redirect_to(config_infos_url) }
      format.xml  { head :ok }
      format.js   do 
        render :update do |page|
          page.call "Modalbox.hide"
          if @config_info.config_key == ConfigInfo::KEY_HAND_FEE_RATE
            page.remove "hand_fee_#{params[:id]}"
          elsif @config_info.config_key == ConfigInfo::KEY_QUERY_DATE_RANGE
            page.remove "query_range_#{params[:id]}"
          end
        end
      end
    end
  end
end
