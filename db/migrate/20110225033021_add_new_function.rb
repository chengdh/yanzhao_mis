class AddNewFunction < ActiveRecord::Migration
  def self.up
    #添加审核后修改功能
    SystemFunction.create :group_name => "公共信息",:func_name => "审核后修改通知公告",:func_key => "edit_notice_after_publish"
    SystemFunction.create :group_name => "公共信息",:func_name => "审核后修改规章制度",:func_key => "edit_rule_after_publish"
  end

  def self.down
    SystemFunction.find_by_func_key("edit_notice_after_publish").destroy
    SystemFunction.find_by_func_key("edit_rule_after_publish").destroy
  end
end
