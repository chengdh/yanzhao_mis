class RulesController < MessagesController
  # GET /the_models/new
  # GET /the_models/new.xml
  def new
    rule = @model_klazz.new
    #机构设置为当前登录用户所在机构
    rule.org = current_user.org
    rule.doc_no = Rule.gen_doc_no(current_user.org.id)
    instance_variable_set("@#{@param_name}",rule)
  end

end
