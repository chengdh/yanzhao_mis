require 'spec_helper'

describe "/material_inouts/new.html.erb" do
  include MaterialInoutsHelper

  before(:each) do
    assigns[:material_inout] = stub_model(MaterialInout,
      :new_record? => true,
      :org => 1,
      :warehouse => 1,
      :person_name => "value for person_name",
      :note => "value for note"
    )
  end

  it "renders new material_inout form" do
    render

    response.should have_tag("form[action=?][method=post]", material_inouts_path) do
      with_tag("input#material_inout_org[name=?]", "material_inout[org]")
      with_tag("input#material_inout_warehouse[name=?]", "material_inout[warehouse]")
      with_tag("input#material_inout_person_name[name=?]", "material_inout[person_name]")
      with_tag("input#material_inout_note[name=?]", "material_inout[note]")
    end
  end
end
