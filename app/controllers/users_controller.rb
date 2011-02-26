class UsersController < BaseController
  #GET /users
  def index
    the_models = @search.paginate :page => params[:page],:order => "created_at DESC"
    @users = User.paginate :page => params[:page],:order => "org_id"
    @group_users = @users.group_by {|user| user.org.name}
  end
  #GET /users/new
  def new
    @user = User.new
    SystemFunction.all(:conditions => {:is_active => true},:order => "group_name").each do |func|
      @user.powers.build(:system_function => func)
    end
    #对user.powers进行分组
    @group_powers = @user.powers.group_by {|p| p.system_function.group_name}
  end
  #GET users/:id/edit
  def edit
    @user = User.find(params[:id])
    #添加未具备的功能
    SystemFunction.all(:conditions => {:is_active => true},:order => "group_name").each do |func|
      @user.powers.build(:system_function => func,:is_select => false) if @user.powers.system_function_id_eq(func.id).blank?
    end

    @group_powers = @user.powers.group_by {|p| p.system_function.group_name}
  end
  #GET /users/show_org_users
  #显示按照机构进行分组的用户列表
  def show_org_users
    users = @search.is_active_is(true).all(:order => "org_id")
    @org_users = users.group_by {|user| user.org.name}
    respond_to do |format|
      format.html # index.html.erb
      format.js { render :partial => "org_user"}
    end
  end
  # POST /users
  # POST /users.xml
  def create_ex
    @user = User.new(params[:user])

    @group_powers = @user.powers.group_by {|p| p.system_function.group_name}
    respond_to do |format|
      if @user.save
        flash[:notice] = '用户信息保存成功.'
        format.html { redirect_to users_url }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  def update_ex
    @user = User.find(params[:id])

    @group_powers = @user.powers.group_by {|p| p.system_function.group_name}
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = '用户信息修改成功.'
        format.html { redirect_to users_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
