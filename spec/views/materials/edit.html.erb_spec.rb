require 'spec_helper'

describe "/materials/edit.html.erb" do
  include MaterialsHelper

  before(:each) do
    assigns[:material] = @material = stub_model(Material,
      :new_record? => false,
      :name => "value for name",
      :is_active => false,
      :description => "value for description",
      :type => "value for type",
      :min_count => 1,
      :unit => "value for unit"
    )
  end

  it "renders the edit material form" do
    render

    response.should have_tag("form[action=#{material_path(@material)}][method=post]") do
      with_tag('input#material_name[name=?]', "material[name]")
      with_tag('input#material_is_active[name=?]', "material[is_active]")
      with_tag('input#material_description[name=?]', "material[description]")
      with_tag('input#material_type[name=?]', "material[type]")
      with_tag('input#material_min_count[name=?]', "material[min_count]")
      with_tag('input#material_unit[name=?]', "material[unit]")
    end
  end
end
