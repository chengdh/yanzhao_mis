require 'spec_helper'

describe "/warehouses/edit.html.erb" do
  include WarehousesHelper

  before(:each) do
    assigns[:warehouse] = @warehouse = stub_model(Warehouse,
      :new_record? => false,
      :name => "value for name",
      :is_active => false,
      :note => "value for note",
      :manager => "value for manager"
    )
  end

  it "renders the edit warehouse form" do
    render

    response.should have_tag("form[action=#{warehouse_path(@warehouse)}][method=post]") do
      with_tag('input#warehouse_name[name=?]', "warehouse[name]")
      with_tag('input#warehouse_is_active[name=?]', "warehouse[is_active]")
      with_tag('input#warehouse_note[name=?]', "warehouse[note]")
      with_tag('input#warehouse_manager[name=?]', "warehouse[manager]")
    end
  end
end
