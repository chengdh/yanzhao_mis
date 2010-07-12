# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  before_filter :authenticate_user!
  before_filter :filter_init
  #初始化系统
  def filter_init
    if Client.count == 0
      redirect_to new_client_path
    end
  end

end
