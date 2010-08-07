class VipInfosController < BaseController
  # GET /vip_infos
  # GET /vip_infos.xml
  def index

    @vip_infos = @search.paginate :page => params[:page],:order => "org_id,level DESC,cur_fee DESC,state,created_at DESC"

    @group_vip_infos = @vip_infos.group_by{|info| "#{info.org.name}-#{VipConfig.levels[info.level]}"}

    @sum_info = {:sum_fee => @search.sum(:cur_fee)}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vip_infos }
      format.csv  { send_data @search.all.export_csv(VipInfo.export_options)}
    end
  end
  # DELETE /vip_infos/remove
  # 按月份删除vip信息
  def remove
    conditions = {:last_import_mth => params[:mth],:org_id => params[:org_id] }
    conditions[:org_id] = params[:org_id] if !params[:org_id].blank?
    count = VipInfo.destroy_all(conditions).size
    flash[:notice] = "共删除了#{count}条VIP信息."
    redirect_to :action => :index
  end
  #生成@search对象
  def create_search
    if current_user.is_admin
      @search = @model_klazz.search(params[:search])
    else
      @search = @model_klazz.org_id_is(current_user.org_id).search(params[:search])
    end
  end
end
