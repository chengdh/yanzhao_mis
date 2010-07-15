#监听notice 和 rules的发布,向message_visitors表中添加当前用户数据
class MessageObserver < ActiveRecord::Observer
  observe :notice,:rule
  def after_save(message)
    if !message.is_secure 
      User.all(:conditions => {:is_active => true}).each do |user|
        visit_infos = message.message_visitors.all(:conditions => {:user_id => user.id})
        if visit_infos.blank?
          mv = MessageVisitor.new(:user => user,:base_public_message => message)
          mv.save
        end
      end
    end
  end
end
