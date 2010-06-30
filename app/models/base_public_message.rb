class BasePublicMessage < ActiveRecord::Base
  include AASM
  belongs_to :org
  belongs_to :user
  belongs_to :publisher,:class_name => "User"
  has_many :message_visitors,:autosave => true
  has_many :visitors,:through => :message_visitors,:source => :user,:uniq => true
  aasm_column :state
  aasm_initial_state :draft   #初始状态为草稿
  aasm_state :draft,:desc => "草稿"           #草稿
  aasm_state :waitting,:desc => "等待发布"       #已确认
  aasm_state :published,:desc => "已发布"       #已确认
  aasm_event :require_publish do
    transitions :to => :waitting,:from => :draft
  end
  aasm_event :publish do
    transitions :to => :published,:from => :waitting
  end
  #得到收信人列表字符串
  def visitors_list
    ret = ""
    self.visitors.each do |visitor|
      ret +="#{visitor.username},"
    end
    ret
  end

end
