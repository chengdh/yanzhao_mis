require 'spec_helper'

describe "/material_inouts/show.html.erb" do
  include MaterialInoutsHelper
  before(:each) do
    assigns[:material_inout] = @material_inout = stub_model(MaterialInout,
      :org => 1,
      :warehouse => 1,
      :person_name => "value for person_name",
      :note => "value for note"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ person_name/)
    response.should have_text(/value\ for\ note/)
  end
end
