class MaterialInoutLinesController < BaseController
  def index
    #耐用品在科室的汇总显示
    @material_inout_lines = @search.material_inout_type_is("DurableShippment").all(
      :select => "material_inouts.org_id,material_inout_lines.material_id,sum(material_inout_lines.qty) qty,
                  sum(material_inout_lines.line_amt) amt ",
      :order => "material_inouts.org_id,material_inout_lines.material_id",
      :group => "material_inouts.org_id,material_inout_lines.material_id")
   # .paginate :page => params[:page],:order => "created_at DESC"
    @group_material_inout_lines = @material_inout_lines.group_by {|line| Org.find(line.org_id).name}
  end
end
