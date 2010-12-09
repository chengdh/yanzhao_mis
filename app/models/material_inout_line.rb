class MaterialInoutLine < ActiveRecord::Base
  belongs_to :material_inout
  belongs_to :material
  def self.export_options
    {
      :methods => [:material_name,:unit,:price,:qty,:line_amt],
      :only => []
    }
  end

  def material_name
    self.material.name
  end
  def unit
    self.material.unit
  end
end
