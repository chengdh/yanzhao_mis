require 'spec_helper'

describe "/material_inouts/edit.html.erb" do
  include MaterialInoutsHelper

  before(:each) do
    assigns[:material_inout] = @material_inout = stub_model(MaterialInout,
      :new_record? => false,
      :org => 1,
      :warehouse => 1,
      :person_name => "value for person_name",
      :note => "value for note"
    )
  end

  it "renders the edit material_inout form" do
    render

    response.should have_tag("form[action=#{material_inout_path(@material_inout)}][method=post]") do
      with_tag('input#material_inout_org[name=?]', "material_inout[org]")
      with_tag('input#material_inout_warehouse[name=?]', "material_inout[warehouse]")
      with_tag('input#material_inout_person_name[name=?]', "material_inout[person_name]")
      with_tag('input#material_inout_note[name=?]', "material_inout[note]")
    end
  end
end
