require 'spec_helper'

describe "/warehouses/index.html.erb" do
  include WarehousesHelper

  before(:each) do
    assigns[:warehouses] = [
      stub_model(Warehouse,
        :name => "value for name",
        :is_active => false,
        :note => "value for note",
        :manager => "value for manager"
      ),
      stub_model(Warehouse,
        :name => "value for name",
        :is_active => false,
        :note => "value for note",
        :manager => "value for manager"
      )
    ]
  end

  it "renders a list of warehouses" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", "value for note".to_s, 2)
    response.should have_tag("tr>td", "value for manager".to_s, 2)
  end
end
