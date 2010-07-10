require 'spec_helper'

describe "/vip_configs/new.html.erb" do
  include VipConfigsHelper

  before(:each) do
    assigns[:vip_config] = stub_model(VipConfig,
      :new_record? => true,
      :org => 1,
      :name => "value for name",
      :fee_from => 9.99,
      :fee_to => 9.99
    )
  end

  it "renders new vip_config form" do
    render

    response.should have_tag("form[action=?][method=post]", vip_configs_path) do
      with_tag("input#vip_config_org[name=?]", "vip_config[org]")
      with_tag("input#vip_config_name[name=?]", "vip_config[name]")
      with_tag("input#vip_config_fee_from[name=?]", "vip_config[fee_from]")
      with_tag("input#vip_config_fee_to[name=?]", "vip_config[fee_to]")
    end
  end
end
