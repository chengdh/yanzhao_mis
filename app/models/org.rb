class Org < ActiveRecord::Base
  belongs_to :user
  has_many :users
  validates_presence_of :name,:message => "名称不可为空"
  #只返回具有给定权限的user列表
  def users_by_power(func_key)
    ret_users = self.users.is_active_is(true).system_functions_func_key_is(func_key)
    #加上管理员
    admin_users = self.users.is_active_is(true).is_admin(true)
    ret_users + admin_users
  end

end
