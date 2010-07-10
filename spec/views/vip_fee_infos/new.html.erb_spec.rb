require 'spec_helper'

describe "/vip_fee_infos/new.html.erb" do
  include VipFeeInfosHelper

  before(:each) do
    assigns[:vip_fee_info] = stub_model(VipFeeInfo,
      :new_record? => true,
      :name => "value for name",
      :phone => "value for phone",
      :phone => "value for phone",
      :mth => "value for mth",
      :fee => 9.99
    )
  end

  it "renders new vip_fee_info form" do
    render

    response.should have_tag("form[action=?][method=post]", vip_fee_infos_path) do
      with_tag("input#vip_fee_info_name[name=?]", "vip_fee_info[name]")
      with_tag("input#vip_fee_info_phone[name=?]", "vip_fee_info[phone]")
      with_tag("input#vip_fee_info_phone[name=?]", "vip_fee_info[phone]")
      with_tag("input#vip_fee_info_mth[name=?]", "vip_fee_info[mth]")
      with_tag("input#vip_fee_info_fee[name=?]", "vip_fee_info[fee]")
    end
  end
end
