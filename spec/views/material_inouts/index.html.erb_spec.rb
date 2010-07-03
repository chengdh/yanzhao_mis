require 'spec_helper'

describe "/material_inouts/index.html.erb" do
  include MaterialInoutsHelper

  before(:each) do
    assigns[:material_inouts] = [
      stub_model(MaterialInout,
        :org => 1,
        :warehouse => 1,
        :person_name => "value for person_name",
        :note => "value for note"
      ),
      stub_model(MaterialInout,
        :org => 1,
        :warehouse => 1,
        :person_name => "value for person_name",
        :note => "value for note"
      )
    ]
  end

  it "renders a list of material_inouts" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for person_name".to_s, 2)
    response.should have_tag("tr>td", "value for note".to_s, 2)
  end
end
