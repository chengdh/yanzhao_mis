class PostInfo < ActiveRecord::Base
  belongs_to :user
  has_many :bills
end
