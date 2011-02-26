class AddViolationAndOtherFunction < ActiveRecord::Migration
  def self.up
    #违规记录
    SystemFunction.create :group_name => "违规处罚",:func_name => "新建违规记录",:func_key => "new_violation"
    SystemFunction.create :group_name => "违规处罚",:func_name => "处罚信息",:func_key => "new_punishment"
    #投票系统
    SystemFunction.create :group_name => "投票系统",:func_name => "新建投票信息",:func_key => "new_vote"
  end

  def self.down
    SystemFunction.find_by_func_key("new_violation").destroy
    SystemFunction.find_by_func_key("new_punishment").destroy
    #SystemFunction.find_by_func_key("new_vote").destroy
  end
end
