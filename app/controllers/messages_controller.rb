#通知公告、规章制度基础controller
class MessagesController < BaseController
  #此处改变filter的顺序,先跳过基类的filter,然后重新声明
  skip_before_filter :check_unread_messages
  before_filter :before_show,:only => :show
  before_filter :check_unread_messages


  # GET /the_models
  # GET /the_models.xml
  def index
    messages = @search.paginate :page => params[:page],:order => "created_at DESC,org_id"
    #对通知公告信息按照发布部门进行分组
    messages_group = messages.group_by {|message| message.org.name }

    instance_variable_set("@#{@param_name.tableize}",messages)
    instance_variable_set("@#{@param_name.tableize}_group",messages_group)
    respond_to do |format|
      format.html { render params[:template] if !params[:template].blank? }# index.html.erb
      format.xml  { render :xml => messages }
    end
  end
  # GET /the_models/new
  # GET /the_models/new.xml
  def new
    message = @model_klazz.new
    #机构设置为当前登录用户所在机构
    message.org = current_user.org
    instance_variable_set("@#{@param_name}",message)
  end

  # GET /the_models/1/edit
  def edit
    message = @model_klazz.find(params[:id])
    instance_variable_set("@#{@param_name}",message)
  end

  # POST /the_models
  # POST /the_models.xml
  def create
    message = @model_klazz.new(params[@param_name])
    message.user = current_user

    instance_variable_set("@#{@param_name}",message)
    set_message_visitor
    #请求发布该信息
    message.require_publish

    respond_to do |format|
      if message.save
        flash[:notice] = "#{@model_klazz.human_name}创建成功."
        format.html { redirect_to :back }
        format.xml  { render :xml => message, :status => :created, :location => message }
      else
        format.html { render "shared/messages/new" }
        format.xml  { render :xml => message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /the_models/1/publish
  def update
    message = @model_klazz.find(params[:id])

    instance_variable_set("@#{@param_name}",message)
    set_message_visitor

    respond_to do |format|
      if message.update_attributes(params[@param_name])
        flash[:notice] = "#{@model_klazz.human_name}更新成功."
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        format.html { render "shared/messages/edit" }
        format.xml  { render :xml => message.errors, :status => :unprocessable_entity }
      end
    end
  end
  # PUT /the_models/1/publish
  # 发布信息
  def publish
    message = @model_klazz.find(params[:id])
    message.publish

    instance_variable_set("@#{@param_name}",message)
    set_message_visitor
    message.publisher = current_user
    message.publish_date = Time.now
    respond_to do |format|
      if message.update_attributes(params[@param_name])

        flash[:notice] = "#{@model_klazz.human_name}发布成功."
        format.html { redirect_to :back }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => message.errors, :status => :unprocessable_entity }
      end
    end
  end
  # GET /the_models/1
  # 查看信息
  def show
    message = @model_klazz.find(params[:id])

    instance_variable_set("@#{@param_name}",message)
    
    respond_to do |format|
      if message.save
        format.html
        format.xml  { head :ok }
      else
        format.html { redirect_to :back }
      end
    end
  end
  #GET overdue_search 超期信息查询
  def show_overdue_search
  end
  #超期查询
  #GET messages/overdue_search
  def overdue_search
    overdue_days = params[:overdue_days].blank? ? 5 : params[:overdue_days].to_i
    messages = @search.overdue_messages(overdue_days).paginate :page => params[:page],:order => "created_at DESC,org_id"
    #对通知公告信息按照发布部门进行分组
    messages_group = messages.group_by {|message| message.org.name }
    instance_variable_set("@#{@param_name.tableize}",messages)
    instance_variable_set("@#{@param_name.tableize}_group",messages_group)

    respond_to do |format|
      format.html { render :index }
      format.xml  { render :xml => messages }
    end

  end
  protected
  def before_show
    message = @model_klazz.find(params[:id])
    message.save_visit_info(current_user) if message.state == 'published'
  end
  def set_message_visitor
    select_user_ids = params[:select_user]
    return if select_user_ids.blank?
    message = instance_variable_get("@#{@param_name}")
    message.visitors.clear
    select_user_ids.each do |user_id|
      mv = MessageVisitor.new(:user_id => user_id)
      mv.base_public_message = message
      message.message_visitors<< mv
    end
  end
  #生成@search对象
  def create_search
    if current_user.is_admin
      @search = @model_klazz.search(params[:search])
    else
      @search = @model_klazz.my_messages(current_user).search(params[:search])
    end
  end
end
