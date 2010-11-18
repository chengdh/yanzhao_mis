class MStoragesController < BaseController
  def index 
    @m_storages = @search.paginate :page => params[:page],:per_page => 8,:order => "created_at DESC"
    @sum_info = @search.sum('qty*avg_price')
  end

  #GET /materials/show_search
  #显示查询物品界面
  def show_search
    @m_storages = @search.paginate :page => params[:page],:per_page => 8,:order => "created_at DESC"
    respond_to do |format|
      format.js { render :partial => "show_search"}
    end
  end
  #GET /materials/search.js
  #根据条件查询结果
  def search
    @m_storages = @search.paginate :page => params[:page],:per_page => 8,:order => "created_at DESC"
    respond_to do |format|
      format.js { render :partial => "list"}
    end
  end
end
