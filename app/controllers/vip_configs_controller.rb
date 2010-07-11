class VipConfigsController < BaseController
  # GET /vip_configs
  # GET /vip_configs.xml
  def index
    @vip_configs = VipConfig.all(:order => "org_id,name DESC")
    @group_vip_configs = @vip_configs.group_by(&:org)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vip_configs }
    end
  end
  def edit
    @vip_config = VipConfig.find(params[:id])
    respond_to do |format|
      format.html # edit.html.erb
      format.js   { render :partial => "edit"}
      format.xml  { render :xml => @vip_configs }
    end
  end
  # PUT /the_models/1
  # PUT /the_models/1.xml
  def update
    the_model = @model_klazz.find(params[:id])
    instance_variable_set("@#{@param_name}",the_model)
    respond_to do |format|
      if the_model.update_attributes(params[@param_name])
        flash[:notice] = 'VIP设置信息更新成功.'
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        flash[:error] = 'VIP设置信息更新失败.'
        format.html { redirect_to :back }
        format.xml  { render :xml => the_model.errors, :status => :unprocessable_entity }
      end
    end
  end
end
