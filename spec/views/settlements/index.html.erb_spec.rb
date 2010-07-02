require 'spec_helper'

describe "/settlements/index.html.erb" do
  include SettlementsHelper

  before(:each) do
    assigns[:settlements] = [
      stub_model(Settlement,
        :org => 1,
        :user => 1,
        :mth => "value for mth",
        :is_active => false,
        :start_fee => 9.99,
        :start_carrying_fee => 9.99,
        :start_net_income => 9.99,
        :start_push_money => 9.99,
        :back_fee => 9.99,
        :back_carrying_fee => 9.99,
        :back_net_income => 9.99,
        :back_push_money => 9.99,
        :total_push_money => 9.99,
        :total_subsidy => 9.99,
        :total_deduction => 9.99,
        :act_push_money => 9.99
      ),
      stub_model(Settlement,
        :org => 1,
        :user => 1,
        :mth => "value for mth",
        :is_active => false,
        :start_fee => 9.99,
        :start_carrying_fee => 9.99,
        :start_net_income => 9.99,
        :start_push_money => 9.99,
        :back_fee => 9.99,
        :back_carrying_fee => 9.99,
        :back_net_income => 9.99,
        :back_push_money => 9.99,
        :total_push_money => 9.99,
        :total_subsidy => 9.99,
        :total_deduction => 9.99,
        :act_push_money => 9.99
      )
    ]
  end

  it "renders a list of settlements" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for mth".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
  end
end
