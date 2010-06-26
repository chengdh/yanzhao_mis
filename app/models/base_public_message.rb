class BasePublicMessage < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :publisher,:class_name => "User"
end
