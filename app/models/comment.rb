class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates_presence_of :body,:message => "回复信息不可为空"
end
