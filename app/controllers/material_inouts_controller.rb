class MaterialInoutsController < BaseController
  def new
    bill = @model_klazz.new(:inout_date => Date.today)
    2.times {bill.material_inout_lines.build }
    instance_variable_set("@#{@param_name}",bill)
  end
end
