require 'spec_helper'

describe "/warehouses/show.html.erb" do
  include WarehousesHelper
  before(:each) do
    assigns[:warehouse] = @warehouse = stub_model(Warehouse,
      :name => "value for name",
      :is_active => false,
      :note => "value for note",
      :manager => "value for manager"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/false/)
    response.should have_text(/value\ for\ note/)
    response.should have_text(/value\ for\ manager/)
  end
end
