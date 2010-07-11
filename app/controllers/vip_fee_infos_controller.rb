class VipFeeInfosController < BaseController
  # GET /vip_fee_infos
  # GET /vip_fee_infos.xml
  def index

    @vip_fee_infos = @search.paginate :page => params[:page],:order => "org_id,mth DESC,fee DESC,created_at DESC"
    @group_vip_fee_infos = @vip_fee_infos.group_by{|info| info.org.name}
    @sum_info = {:sum_fee => @search.sum(:fee)}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vip_fee_infos }
    end
  end
end
