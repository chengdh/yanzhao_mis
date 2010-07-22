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
end
