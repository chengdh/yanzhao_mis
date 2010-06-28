# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #所有部门/分理处/分公司选择
  def orgs_for_select
    Org.all(:conditions => {:is_active => true},:order => "name ASC").collect { |org| [org.name, org.id] }
  end
  #按照机构分组选择用户
  def option_groups_orgs_users_for_select(search_param ={})
    #没有用户及无效的机构被剔除
    search = Org.is_active_is(true).search(search_param)
    option_groups_from_collection_for_select(search.all,:users,:name,:id,:username)
  end
  #按照机构分组选择用户
  def option_groups_departments_users_for_select(search_param ={})
    #没有用户及无效的机构被剔除
    search = Department.is_active_is(true).search(search_param)
    option_groups_from_collection_for_select(search.all,:users,:name,:id,:username)
  end

  #科室选择
  def departments_for_select
    Department.all(:conditions => {:is_active => true},:order => "name ASC").collect { |org| [org.name, org.id] }
  end
  #分公司选择
  def sub_companies_for_select
    SubCompany.all(:conditions => {:is_active => true},:order => "name ASC").collect { |org| [org.name, org.id] }
  end
  def users_for_select
    User.all(:conditions => {:is_active => true},:order => "org_id,username").collect { |user| [user.username, user.id] }
  end
  #选择清单状态
  def state_for_select(const_class)
    const_class.aasm_states.collect {|state| [state.options[:desc],state.name]}
  end
  #单据状态的描述
  def state_display(const_class,state_code)
    the_state = const_class.aasm_states.detect {|state| state.name.to_s == state_code}
    the_state.options[:desc] if !the_state.blank?
  end  

  #当前event描述
  def event_display(const_class,event_name)
    the_event = const_class.aasm_events[event_name]
    the_event.options[:desc] if !the_event.blank?
  end
end
