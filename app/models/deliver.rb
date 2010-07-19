class Deliver < ActiveRecord::Base
  belongs_to :user
  has_many :bills
  validates_presence_of :deliver_name,:message => "不可为空"
end
