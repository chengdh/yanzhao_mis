require 'spec_helper'

describe "/materials/show.html.erb" do
  include MaterialsHelper
  before(:each) do
    assigns[:material] = @material = stub_model(Material,
      :name => "value for name",
      :is_active => false,
      :description => "value for description",
      :type => "value for type",
      :min_count => 1,
      :unit => "value for unit"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/false/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ type/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ unit/)
  end
end
