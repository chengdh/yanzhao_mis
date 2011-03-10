class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable,:rememberable,:registerable
  #:confirmable, :recoverable,:registerable,:rememberable, :trackable, :validatable

  belongs_to :org
  has_many :powers
  has_many :system_functions,:through => :powers

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation,:is_admin,:is_active,:org_id,:remember_me,:powers_attributes,:level
  accepts_nested_attributes_for :powers
end
