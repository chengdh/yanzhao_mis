require 'spec_helper'

describe "/vip_configs/show.html.erb" do
  include VipConfigsHelper
  before(:each) do
    assigns[:vip_config] = @vip_config = stub_model(VipConfig,
      :org => 1,
      :name => "value for name",
      :fee_from => 9.99,
      :fee_to => 9.99
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
  end
end
