class Post < BasePublicMessage
  has_many :comments
  #自动发布
  def before_create
    self.publish
  end

end
