require 'spec_helper'

describe "/vip_configs/edit.html.erb" do
  include VipConfigsHelper

  before(:each) do
    assigns[:vip_config] = @vip_config = stub_model(VipConfig,
      :new_record? => false,
      :org => 1,
      :name => "value for name",
      :fee_from => 9.99,
      :fee_to => 9.99
    )
  end

  it "renders the edit vip_config form" do
    render

    response.should have_tag("form[action=#{vip_config_path(@vip_config)}][method=post]") do
      with_tag('input#vip_config_org[name=?]', "vip_config[org]")
      with_tag('input#vip_config_name[name=?]', "vip_config[name]")
      with_tag('input#vip_config_fee_from[name=?]', "vip_config[fee_from]")
      with_tag('input#vip_config_fee_to[name=?]', "vip_config[fee_to]")
    end
  end
end
