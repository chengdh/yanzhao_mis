class Org < ActiveRecord::Base
  belongs_to :user
  has_many :users
  validates_presence_of :name,:message => "名称不可为空"
end
