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
  before_filter :check_alert
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
  #检查警报信息,包括库存报警,合同到期报警
  def check_alert
    if user_signed_in?
      #易耗品库存报警
      @storage_alert_count = MStorage.alert_is(true).material_type_is('ConsumerMaterial').count
      #合同到期前三个月系统自动提醒
      @contract_alert_count = Contract.alert_is(false).date_to_lte(3.months.since.to_date).count
    end
  end
end
