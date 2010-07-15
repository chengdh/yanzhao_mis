# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  before_filter :authenticate_user!
  before_filter :filter_init

  before_filter :check_unread_messages
  protected
  #初始化系统
  def filter_init
    if Client.count == 0
      redirect_to new_client_path
    end
  end
  #检查未读公告/规章制度/消息
  def check_unread_messages
    if user_signed_in?
      @unread_notices_count = Notice.unread_messages(current_user).count 
      @unread_rules_count = Rule.unread_messages(current_user).count 
      @unread_posts_count = Post.unread_messages(current_user).count
    end
  end
end
