require 'spec_helper'

describe "/materials/index.html.erb" do
  include MaterialsHelper

  before(:each) do
    assigns[:materials] = [
      stub_model(Material,
        :name => "value for name",
        :is_active => false,
        :description => "value for description",
        :type => "value for type",
        :min_count => 1,
        :unit => "value for unit"
      ),
      stub_model(Material,
        :name => "value for name",
        :is_active => false,
        :description => "value for description",
        :type => "value for type",
        :min_count => 1,
        :unit => "value for unit"
      )
    ]
  end

  it "renders a list of materials" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for unit".to_s, 2)
  end
end
