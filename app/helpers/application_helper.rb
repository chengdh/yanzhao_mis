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
  #选择仓库
  def warehouses_for_select
    Warehouse.all(:conditions => {:is_active => true},:order => "name ASC").collect { |warehouse| [warehouse.name, warehouse.id] }
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
  #月份选择,提供前后2年的月份选择
  def months_for_select
    ret = [] 
    (-12..12).collect do |mth|
      time = mth.month.from_now
      ret = ret + [ [time.strftime("%Y%m"),time.strftime("%Y年%m月")]]
    end
    ret.collect {|item| [item[1],item[0]]}
  end
  #金额转中文大写
  def ConvertNumToChinese(num)
    chineseNumArr=['零','壹','贰','叁','肆','伍','陆','柒','捌','玖']
    chinesePosArr=['万','仟','佰','拾','亿','仟','佰','拾','万','仟','佰','拾','元','角','分']
    chineseNum=''
    chinesePos=''
    strChinese=''
    nzero=0
    strNum=(num*100).to_i.to_s
    i=0
    length=strNum.length
    posValue=0
    pos=chinesePosArr.length-length
    while i<length
      posValue=strNum[i].chr.to_i

      if(i!=(length-3) && i!=(length-7) && i!=(length-11) && i!=(length-15))
        if(posValue==0)
          chineseNum=''
          chinesePos=''
          nzero+=1
        else 
          if(nzero!=0)
            chineseNum=chineseNumArr[0]+chineseNumArr[posValue]
            chinesePos=chinesePosArr[pos+i]
            nzero=0
          else
            chineseNum=chineseNumArr[posValue]
            chinesePos=chinesePosArr[pos+i]
            nzero=0
          end
        end
      else
        if(posValue!=0 && nzero!=0)
          chineseNum=chineseNumArr[0]+chineseNumArr[posValue]
          chinesePos=chinesePosArr[pos+i]
          nzero=0
        else
          if(posValue!=0 && nzero==0)
            chineseNum=chineseNumArr[posValue]
            chinesePos=chinesePosArr[pos+i]
            nzero=0
          else
            if(length>=11)
              chineseNum=''
              nzero+=1
            else
              chineseNum=''
              chinesePos=chinesePosArr[pos+i]
              nzero+=1
            end
          end
        end 
      end
      if(i==(length-11) || i==(length-3))
        chinesePos=chinesePosArr[pos+i]
      end
      strChinese=strChinese+chineseNum+chinesePos
      if(i==(length-1) && posValue==0)
        strChinese=strChinese+'整'
      end
      i+=1
    end 
    strChinese 
  end
  #根据起始和结束日期得到日期月份列表
  def months_range(start_dt,end_dt)
    ret = ActiveSupport::OrderedHash.new
    0.upto(40) do |n|
      tmp = start_dt.months_since(n).to_date
      if tmp <= end_dt
        ret[tmp.strftime("%Y%m")] = tmp.strftime("%Y年%m月")
      end
    end
    ret
  end
end
