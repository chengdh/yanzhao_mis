require 'spec_helper'

describe "/vip_infos/show.html.erb" do
  include VipInfosHelper
  before(:each) do
    assigns[:vip_info] = @vip_info = stub_model(VipInfo,
      :org => 1,
      :name => "value for name",
      :phone => "value for phone",
      :cur_fee => 9.99,
      :level => "value for level",
      :state => "value for state"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ phone/)
    response.should have_text(/9\.99/)
    response.should have_text(/value\ for\ level/)
    response.should have_text(/value\ for\ state/)
  end
end
