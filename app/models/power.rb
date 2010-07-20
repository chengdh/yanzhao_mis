class Power < ActiveRecord::Base
  belongs_to :user
  belongs_to :system_function
end
