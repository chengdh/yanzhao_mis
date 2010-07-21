class Post < BasePublicMessage
  validates_presence_of :title,:message => "标题不可为空."
  has_many :comments
  #自动发布
  def before_create
    self.publish
  end

end
