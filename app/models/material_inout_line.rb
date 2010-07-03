class MaterialInoutLine < ActiveRecord::Base
  belongs_to :material_inout
  belongs_to :material
end
