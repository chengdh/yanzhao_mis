class BasePublicMessage < ActiveRecord::Base
  validates_presence_of :title,:message => "标题不可为空."
  include AASM
  #包含以下三种message
  #发送给该用户的
  #公共的
  #该用户自己建立的
  named_scope :my_messages,lambda { |user|
    {
      :joins => :message_visitors,
      :select => "DISTINCT base_public_messages.*",
      :conditions => ["base_public_messages.user_id = ? OR base_public_messages.publisher_id = ? OR message_visitors.user_id = ?",user,user,user],
      :order => "base_public_messages.created_at DESC"
    }
  }
  #未读信息
  named_scope :unread_messages,lambda{ |user|
  {
      :joins => :message_visitors ,
      :select => "DISTINCT base_public_messages.*",
      :conditions => ["base_public_messages.state = 'published' AND message_visitors.state='draft' AND message_visitors.user_id = ?",user], 
      :order => "base_public_messages.created_at DESC"
    }
  }
  #超期未读信息
  named_scope :overdue_messages,lambda{|overdue_days|
    {
      :joins => :message_visitors,
      :select => "DISTINCT base_public_messages.*",
      :conditions => ["base_public_messages.state = 'published' AND base_public_messages.publish_date <= ? AND message_visitors.state = 'draft'",overdue_days.days.ago.beginning_of_day],
      :order => "base_public_messages.created_at DESC"
    }
  }
  belongs_to :org
  belongs_to :user
  belongs_to :publisher,:class_name => "User"
  has_many :message_visitors,:autosave => true
  has_many :visitors,:through => :message_visitors,:source => :user,:uniq => true
  aasm_column :state
  aasm_initial_state :draft   #初始状态为草稿
  aasm_state :draft,:desc => "草稿"           #草稿
  aasm_state :waitting,:desc => "等待审核"       #等待发布
  aasm_state :published,:desc => "已发布"       #已发布
  aasm_event :require_publish do
    transitions :to => :waitting,:from => :draft
  end
  aasm_event :publish do
    transitions :to => :published,:from => [:waitting,:draft]
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
    #先判断查看记录中是否已存在记录
    visit_infos = self.message_visitors.all(:conditions => {:user_id => user.id})
    if visit_infos.blank?
      mv = MessageVisitor.new(:user => user)
      mv.visit
      self.message_visitors << mv
    else
      visit_infos.first.update_attributes(:visited_at => Time.now,:state => "visited")
    end
  end
end
