#通知公告、规章制度基础controller
class MessagesController < BaseController
  # GET /the_models
  # GET /the_models.xml
  def index
    messages = @search.paginate :page => params[:page],:order => "created_at DESC,org_id"
    #对通知公告信息按照发布部门进行分组
    messages_group = messages.group_by {|message| message.org.name }

    instance_variable_set("@#{@param_name.tableize}",messages)
    instance_variable_set("@#{@param_name.tableize}_group",messages_group)
  end
  # GET /the_models/new
  # GET /the_models/new.xml
  def new
    message = @model_klazz.new
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

    instance_variable_set("@#{@param_name}",message)
    set_message_visitor
    #请求发布该信息
    message.require_publish

    respond_to do |format|
      if message.save
        flash[:notice] = '@model_klazz was successfully created.'
        format.html { redirect_to :action => :index }
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
        flash[:notice] = '@model_klazz was successfully updated.'
        format.html { redirect_to :action => :index }
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
    #FIXME 设置发布人及发布日期
    respond_to do |format|
      if message.update_attributes(params[@param_name])
        flash[:notice] = '@model_klazz was successfully updated.'
        format.html { redirect_to :action => :index }
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
    save_visit_info
    respond_to do |format|
      if message.save
        format.html { render "shared/messages/show" }
        format.xml  { head :ok }
      else
        format.html { redirect_to :index }
      end
    end
  end
  protected
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
  #保存查看信息
  def save_visit_info
    message = instance_variable_get("@#{@param_name}")
    #FIXME 需要修改成按照当前用户的信息来查询查看记录 
    #先判断查看记录中是否已存在记录
    visit_infos = message.message_visitors.all(:conditions => {:user_id => 0})
    if visit_infos.blank?
      mv = MessageVisitor.new(:user_id => 1)
      mv.base_public_message = message
      mv.visit
      message.message_visitors<< mv
    end
  end
end
