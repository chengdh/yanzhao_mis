class Rule < BasePublicMessage

  validates_presence_of :title,:message => "标题不可为空."
end
