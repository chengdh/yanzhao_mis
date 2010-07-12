class BasePublicMessage < ActiveRecord::Base
  #包含以下三种message
  #发送给该用户的
  #公共的
  #该用户自己建立的
  named_scope :my_messages,lambda { |user|
    {
      :joins => "LEFT JOIN message_visitors ON message_visitors.base_public_message_id  = base_public_messages.id",
      :select => "DISTINCT base_public_messages.*,message_visitors.state visit_state",
      :conditions => ["(base_public_messages.is_secure = 0 OR base_public_messages.user_id=? OR message_visitors.user_id = ?) ",user,user],
      :order => "base_public_messages.created_at DESC"
    }
  }
  include AASM
  belongs_to :org
  belongs_to :user
  belongs_to :publisher,:class_name => "User"
  has_many :message_visitors,:autosave => true
  has_many :visitors,:through => :message_visitors,:source => :user,:uniq => true
  aasm_column :state
  aasm_initial_state :draft   #初始状态为草稿
  aasm_state :draft,:desc => "草稿"           #草稿
  aasm_state :waitting,:desc => "等待发布"       #等待发布
  aasm_state :published,:desc => "已发布"       #已发布
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
  #保存查看信息
  def save_visit_info(user)
    #FIXME 需要修改成按照当前用户的信息来查询查看记录 
    #先判断查看记录中是否已存在记录
    visit_infos = self.message_visitors.all(:conditions => {:user_id => user})
    if visit_infos.blank?
      mv = MessageVisitor.new(:user_id => user)

      mv.visit
      self.message_visitors<< mv
    else
      visit_infos.first.visited_at = Time.now
    end
  end
end
