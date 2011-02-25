class Punishment < ActiveRecord::Base
  belongs_to :violation
  belongs_to :user
  belongs_to :target_org,:class_name => "Org"
  validates_presence_of :title,:message => "标题不可为空"
  validates_presence_of :punish_date,:message => "处罚时间不可为空"
  validates_presence_of :content,:message => "内容不可为空"
  validates_presence_of :handled,:message => "经手人不可为空"

  #从违规记录生成处罚记录
  def self.new_with_violation(v)
    punishment = Punishment.new
    punishment.violation = v
    punishment.title = v.title
    punishment.target = v.target
    punishment.target_org = v.target_org
    punishment.content = v.content
    punishment
  end
end
