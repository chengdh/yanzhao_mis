require 'spec_helper'

describe "/vip_fee_infos/show.html.erb" do
  include VipFeeInfosHelper
  before(:each) do
    assigns[:vip_fee_info] = @vip_fee_info = stub_model(VipFeeInfo,
      :name => "value for name",
      :phone => "value for phone",
      :phone => "value for phone",
      :mth => "value for mth",
      :fee => 9.99
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ phone/)
    response.should have_text(/value\ for\ phone/)
    response.should have_text(/value\ for\ mth/)
    response.should have_text(/9\.99/)
  end
end
