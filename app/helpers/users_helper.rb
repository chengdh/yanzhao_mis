module UsersHelper
  #判断当前用户是否具备给定分类的功能权限
  def check_power_group(group_name)
    if current_user.is_admin
      true
    else
      group_power = current_user.powers.group_by {|power| power.system_function.group_name }
      if group_power[group_name].blank?
        false
      else
        group_power[group_name].any? {|power| power.is_select}
      end
    end
  end
  #判断当前用户是否具有给定的权限
  def check_power(func_key)
    if current_user.is_admin
      true
    else
      group_power = current_user.powers.group_by {|power| power.system_function.func_key }
      if group_power[func_key].blank?
        false
      else
        group_power[func_key].any? {|power| power.is_select}
      end
    end

  end
  #用户级别选择
  def user_levels
    [["员工",3],['部门经理',2],['总经理',1],['董事长',0]]
  end
  #管理人员选择,用于意见箱
  def select_for_managers
    User.all(:conditions => {:level => [0,1,2]},:order => 'level ASC').collect {|user| [user.username,user.id]}
  end
  #判断当前用户是否管理人员
  def is_manager?
    [0,1,2].include? current_user.level
  end
end
