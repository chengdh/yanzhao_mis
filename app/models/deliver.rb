class Deliver < ActiveRecord::Base
  belongs_to :user
  has_many :inout_bills
  validates_presence_of :deliver_name,:message => "不可为空"
end
