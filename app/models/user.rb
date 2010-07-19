class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable,:rememberable,:registerable
  #:confirmable, :recoverable,:registerable,:rememberable, :trackable, :validatable

  belongs_to :org
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation,:is_admin,:is_active,:org_id,:remember_me
end
