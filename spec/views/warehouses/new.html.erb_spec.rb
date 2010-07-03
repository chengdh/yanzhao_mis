require 'spec_helper'

describe "/warehouses/new.html.erb" do
  include WarehousesHelper

  before(:each) do
    assigns[:warehouse] = stub_model(Warehouse,
      :new_record? => true,
      :name => "value for name",
      :is_active => false,
      :note => "value for note",
      :manager => "value for manager"
    )
  end

  it "renders new warehouse form" do
    render

    response.should have_tag("form[action=?][method=post]", warehouses_path) do
      with_tag("input#warehouse_name[name=?]", "warehouse[name]")
      with_tag("input#warehouse_is_active[name=?]", "warehouse[is_active]")
      with_tag("input#warehouse_note[name=?]", "warehouse[note]")
      with_tag("input#warehouse_manager[name=?]", "warehouse[manager]")
    end
  end
end
