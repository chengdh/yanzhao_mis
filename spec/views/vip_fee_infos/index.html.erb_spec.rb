require 'spec_helper'

describe "/vip_fee_infos/index.html.erb" do
  include VipFeeInfosHelper

  before(:each) do
    assigns[:vip_fee_infos] = [
      stub_model(VipFeeInfo,
        :name => "value for name",
        :phone => "value for phone",
        :phone => "value for phone",
        :mth => "value for mth",
        :fee => 9.99
      ),
      stub_model(VipFeeInfo,
        :name => "value for name",
        :phone => "value for phone",
        :phone => "value for phone",
        :mth => "value for mth",
        :fee => 9.99
      )
    ]
  end

  it "renders a list of vip_fee_infos" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for phone".to_s, 2)
    response.should have_tag("tr>td", "value for phone".to_s, 2)
    response.should have_tag("tr>td", "value for mth".to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
  end
end
