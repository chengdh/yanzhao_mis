class MStorage < ActiveRecord::Base
  belongs_to :warehouse
  belongs_to :material
end
