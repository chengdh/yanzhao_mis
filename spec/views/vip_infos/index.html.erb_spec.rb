require 'spec_helper'

describe "/vip_infos/index.html.erb" do
  include VipInfosHelper

  before(:each) do
    assigns[:vip_infos] = [
      stub_model(VipInfo,
        :org => 1,
        :name => "value for name",
        :phone => "value for phone",
        :cur_fee => 9.99,
        :level => "value for level",
        :state => "value for state"
      ),
      stub_model(VipInfo,
        :org => 1,
        :name => "value for name",
        :phone => "value for phone",
        :cur_fee => 9.99,
        :level => "value for level",
        :state => "value for state"
      )
    ]
  end

  it "renders a list of vip_infos" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for phone".to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", "value for level".to_s, 2)
    response.should have_tag("tr>td", "value for state".to_s, 2)
  end
end
