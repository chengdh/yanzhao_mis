require 'spec_helper'

describe "/vip_infos/new.html.erb" do
  include VipInfosHelper

  before(:each) do
    assigns[:vip_info] = stub_model(VipInfo,
      :new_record? => true,
      :org => 1,
      :name => "value for name",
      :phone => "value for phone",
      :cur_fee => 9.99,
      :level => "value for level",
      :state => "value for state"
    )
  end

  it "renders new vip_info form" do
    render

    response.should have_tag("form[action=?][method=post]", vip_infos_path) do
      with_tag("input#vip_info_org[name=?]", "vip_info[org]")
      with_tag("input#vip_info_name[name=?]", "vip_info[name]")
      with_tag("input#vip_info_phone[name=?]", "vip_info[phone]")
      with_tag("input#vip_info_cur_fee[name=?]", "vip_info[cur_fee]")
      with_tag("input#vip_info_level[name=?]", "vip_info[level]")
      with_tag("input#vip_info_state[name=?]", "vip_info[state]")
    end
  end
end
