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
    message.user = current_user

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
    message.save_visit_info(current_user) if message.state == 'published'
    
    respond_to do |format|
      if message.save
        format.html
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
  protected
  #生成@search对象
  def create_search
    if current_user.is_admin
      @search = @model_klazz.search(params[:search])
    else
      @search = @model_klazz.my_messages(current_user).search(params[:search])
    end
  end

end
