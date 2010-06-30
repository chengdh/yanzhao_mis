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
  #时间日期的格式化
  def status_time_ago_in_words(dt)
    time = time_ago_in_words(dt)
    case time
    when "less than a minute"
      "刚刚"
    when /minute/
      time.gsub(/minutes|minute/, '分钟') + "前"
    when /hour|days|day/
      if dt.to_date == Time.now.to_date then
        time.gsub(/about (\d+) (hours|hour)/, '\1小时') + "前"
      elsif dt.to_date == Time.now.yesterday.to_date then
        "昨天#{dt.strftime(' %H:%M')}"
      elsif dt.to_date == Time.now.ago(172800).to_date then
        "前天#{dt.strftime(' %H:%M')}"
      else
        dt.strftime("%Y-%m-%d %H:%M")
      end
    else
      dt.strftime("%Y-%m-%d %H:%M")
    end
  end
  #以下参考http://asciicasts.com/episodes/197-nested-model-form-part-2
  #nested Form 中的删除按钮
  def link_to_remove_fields(name, f)  
    f.hidden_field(:_destroy) + link_to_function(name, "com.yanzhao.nestedFormHelper.remove_fields(this)")  
  end  
  #nested form 中的添加按钮
  def link_to_add_fields(name, f, association,content_wrap="")  
    new_object = f.object.class.reflect_on_association(association).klass.new  
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|  
      render(association.to_s.singularize + "_fields", :f => builder)  
    end  
    
    link_to_function(name, h("com.yanzhao.nestedFormHelper.add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\",\"#{content_wrap}\")"))  
  end  
end
