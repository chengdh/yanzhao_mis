class Violation < ActiveRecord::Base
  belongs_to :base_public_message
  belongs_to :user
  belongs_to :target_org,:class_name => "Org"
  has_one :punishment #处罚信息
  #根据未读信息生成违规记录
  def self.new_with_message(message)
    violation = Violation.new
    violation.title = "违规超期未查看信息"
    violation.base_public_message = message
    violation.target = message.message_visitors.collect {|mv| mv.state == 'draft' ? mv.user.username : "" }.uniq.join(",")
    violation.content="以上人员超期未查看信息,记入违规记录"
    violation
  end
  #设置未读信息已生成违规记录标记
  def after_create
    self.base_public_message.update_attributes(:violation_generated => true) if self.base_public_message.present?
  end
end
