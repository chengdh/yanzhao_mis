require 'spec_helper'

describe "/vip_configs/index.html.erb" do
  include VipConfigsHelper

  before(:each) do
    assigns[:vip_configs] = [
      stub_model(VipConfig,
        :org => 1,
        :name => "value for name",
        :fee_from => 9.99,
        :fee_to => 9.99
      ),
      stub_model(VipConfig,
        :org => 1,
        :name => "value for name",
        :fee_from => 9.99,
        :fee_to => 9.99
      )
    ]
  end

  it "renders a list of vip_configs" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
  end
end
