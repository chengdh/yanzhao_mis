class MaterialsController < BaseController
  #GET /materials/show_search
  #显示查询物品界面
  def show_search
    @materials = @search.paginate :page => params[:page],:order => "name DESC"
    respond_to do |format|
      format.js { render :partial => "show_search"}
    end
  end
end
