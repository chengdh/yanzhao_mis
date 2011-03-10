class Suggestion < BasePublicMessage
  accepts_nested_attributes_for :message_visitors
  has_many :comments,:as => :commentable,:dependent => :destroy
  #自动发布
  def before_create
    self.publish
  end
  #自动上发,超过3天未查看,自动上发到上级
  def self.up_send(expire_days=3)
    Suggestion.search(:message_visitors_state_eq => 'draft',:publish_date_lte => expire_days.days.ago.to_date,:up_state => false).all.each do |old_suggest|
      old_receiver = old_suggest.message_visitors.first.user
      unless old_receiver.level == 0  #如果是董事长级别,则不上发
        new_suggest = Suggestion.new
        new_suggest.title = old_suggest.title
        new_suggest.org = old_suggest.org
        new_suggest.body = 
          "<p>原收信人:#{old_receiver.username} 发信时间:#{old_suggest.publish_date}</p>" + 
        "<p>此信件因原收信人超过#{expire_days}未查看,故转发到你处</p>" + old_suggest.body  
        new_suggest.user = old_suggest.user
        up_receiver = User.find_by_level(old_receiver.level - 1)
        new_suggest.message_visitors.build(:user_id => up_receiver.id)
        new_suggest.save!
        old_suggest.update_attributes(:up_state => true)
      end
    end

  end

end
