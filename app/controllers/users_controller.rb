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
end
