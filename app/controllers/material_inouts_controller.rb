class MaterialInoutsController < BaseController
  def new
    @material_inout = MaterialInout.new(:inout_date => Date.today)
    2.times {@material_inout.material_inout_lines.build }
  end
end
