class ScrappedInfosController < BaseController

  # GET /scrapped_infos/1
  # GET /scrapped_infos/1.xml
  def show
    @scrapped_info = ScrappedInfo.find(params[:id])

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @scrapped_info }
    end
  end

  # GET /scrapped_infos/new
  # GET /scrapped_infos/new.xml
  def new
    @scrapped_info = ScrappedInfo.new(:org_id => params[:org_id],:inout_date => Date.today)
    @scrapped_info.material_inout_lines.build(:material_id => params[:material_id],:qty => 1,:price => 0,:line_amt => 0)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scrapped_info }
    end
  end

  # POST /scrapped_infos
  # POST /scrapped_infos.xml
  def create
    @scrapped_info = ScrappedInfo.new(params[:scrapped_info])

    respond_to do |format|
      if @scrapped_info.save
        flash[:notice] = '报废单保存成功.'
        format.html { redirect_to(@scrapped_info) }
        format.xml  { render :xml => @scrapped_info, :status => :created, :location => @scrapped_info }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scrapped_info.errors, :status => :unprocessable_entity }
      end
    end
  end
end
