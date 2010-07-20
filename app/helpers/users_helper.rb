module UsersHelper
  #判断当前用户是否具备给定分类的功能权限
  def check_power_group(group_name)
    if current_user.is_admin
      true
    else
      group_power = current_user.powers.group_by {|power| power.system_function.group_name }
      group_power[group_name].any? {|power| power.is_select}
    end
  end
  #判断当前用户是否具有给定的权限
  def check_power(func_key)
    if current_user.is_admin
      true
    else
      group_power = current_user.powers.group_by {|power| power.system_function.func_key }
      group_power[func_key].any? {|power| power.is_select}
    end

  end
end
