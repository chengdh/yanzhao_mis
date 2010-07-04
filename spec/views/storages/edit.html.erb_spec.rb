require 'spec_helper'

describe "/storages/edit.html.erb" do
  include StoragesHelper

  before(:each) do
    assigns[:storage] = @storage = stub_model(Storage,
      :new_record? => false,
      :warehouse => 1,
      :material => 1,
      :avg_price => 9.99,
      :qty => 1
    )
  end

  it "renders the edit storage form" do
    render

    response.should have_tag("form[action=#{storage_path(@storage)}][method=post]") do
      with_tag('input#storage_warehouse[name=?]', "storage[warehouse]")
      with_tag('input#storage_material[name=?]', "storage[material]")
      with_tag('input#storage_avg_price[name=?]', "storage[avg_price]")
      with_tag('input#storage_qty[name=?]', "storage[qty]")
    end
  end
end
