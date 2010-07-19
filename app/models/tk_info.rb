class TkInfo < ActiveRecord::Base
  belongs_to :user
  has_many :bills
  validates_presence_of :tker_name,:message => "提款人姓名不可为空"
end
