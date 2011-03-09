class VotesController < BaseController
  def new
    #查看当月是否已投票
    mth = Date.today.strftime("%Y%m")
    cur_org = current_user.org

    if Vote.exists?(:mth => mth,:org_id => cur_org)
      flash[:notice] = "当月投票信息已存在."
      @vote = Vote.find_by_mth_and_org_id(mth,cur_org.id)
      render :show

    else
      @vote = Vote.new_with_mth_org(mth,cur_org)
      @vote.user = current_user
    end
  end
  def show
    @vote = Vote.find(params[:id])
    respond_to do |format|
      format.html
      format.csv {send_data @vote.to_csv}
    end
  end
end
