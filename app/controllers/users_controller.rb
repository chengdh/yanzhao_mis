class UsersController < BaseController
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

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
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

    respond_to do |format|
      if @user.update_with_password(params[:user])
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
