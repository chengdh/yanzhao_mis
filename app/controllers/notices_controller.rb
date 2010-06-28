#通知公告
class NoticesController < BaseController
  # GET /the_models
  # GET /the_models.xml
  def index
    @notices = @search.paginate :page => params[:page],:order => "created_at DESC,org_id"
    #对通知公告信息按照发布部门进行分组
    @notices_group = @notices.group_by {|notice| notice.org.name }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notices }
    end
  end

  # POST /the_models
  # POST /the_models.xml
  def create
    @notice = Notice.new(params[:notice])
    set_message_visitor
    #请求发布该信息
    @notice.require_publish

    respond_to do |format|
      if @notice.save
        flash[:notice] = '@model_klazz was successfully created.'
        format.html { redirect_to(notices_url) }
        format.xml  { render :xml => @notice, :status => :created, :location => @notice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /the_models/1/publish
  def update
    @notice = Notice.find(params[:id])
    set_message_visitor
    respond_to do |format|
      if @notice.update_attributes(params[:notice])
        flash[:notice] = '@model_klazz was successfully updated.'
        format.html { redirect_to(@notice) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end
  # PUT /the_models/1/publish
  # 发布信息
  def publish
    @notice = Notice.find(params[:id])
    @notice.publish
    set_message_visitor
    #FIXME 设置发布人及发布日期
    respond_to do |format|
      if @notice.update_attributes(params[:notice])
        flash[:notice] = '@model_klazz was successfully updated.'
        format.html { redirect_to(@notice) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end
  # GET /the_models/1
  # 查看信息
  def show
    @notice = Notice.find(params[:id])
    save_visit_info
    respond_to do |format|
      if @notice.save
        format.html { render :show }
        format.xml  { head :ok }
      else
        format.html { redirect_to :index }
      end
    end
  end

  private
  def set_message_visitor
    select_user_ids = params[:select_user]
    return if select_user_ids.blank?
    @notice.visitors.clear
    select_user_ids.each do |user_id|
      mv = MessageVisitor.new(:user_id => user_id)
      mv.base_public_message = @notice
      @notice.message_visitors<< mv
    end
  end
  #保存查看信息
  def save_visit_info
    #FIXME 需要修改成按照当前用户的信息来查询查看记录 
    #先判断查看记录中是否已存在记录
    visit_infos = @notice.message_visitors.all(:conditions => {:user_id => 0})
    if visit_infos.blank?
      mv = MessageVisitor.new(:user_id => 1)
      mv.base_public_message = @notice
      mv.visit
      @notice.message_visitors<< mv
    end
  end
end
