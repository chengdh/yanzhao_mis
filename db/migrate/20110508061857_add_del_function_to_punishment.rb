class AddDelFunctionToPunishment < ActiveRecord::Migration
  def self.up
    SystemFunction.create :group_name => "违规处罚",:func_name => "删除违规记录",:func_key => "destroy_violation"
    SystemFunction.create :group_name => "违规处罚",:func_name => "删除处罚信息",:func_key => "destroy_punishment"
  end

  def self.down
  end
end
