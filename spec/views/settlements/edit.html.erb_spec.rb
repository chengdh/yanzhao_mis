require 'spec_helper'

describe "/settlements/edit.html.erb" do
  include SettlementsHelper

  before(:each) do
    assigns[:settlement] = @settlement = stub_model(Settlement,
      :new_record? => false,
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
  end

  it "renders the edit settlement form" do
    render

    response.should have_tag("form[action=#{settlement_path(@settlement)}][method=post]") do
      with_tag('input#settlement_org[name=?]', "settlement[org]")
      with_tag('input#settlement_user[name=?]', "settlement[user]")
      with_tag('input#settlement_mth[name=?]', "settlement[mth]")
      with_tag('input#settlement_is_active[name=?]', "settlement[is_active]")
      with_tag('input#settlement_start_fee[name=?]', "settlement[start_fee]")
      with_tag('input#settlement_start_carrying_fee[name=?]', "settlement[start_carrying_fee]")
      with_tag('input#settlement_start_net_income[name=?]', "settlement[start_net_income]")
      with_tag('input#settlement_start_push_money[name=?]', "settlement[start_push_money]")
      with_tag('input#settlement_back_fee[name=?]', "settlement[back_fee]")
      with_tag('input#settlement_back_carrying_fee[name=?]', "settlement[back_carrying_fee]")
      with_tag('input#settlement_back_net_income[name=?]', "settlement[back_net_income]")
      with_tag('input#settlement_back_push_money[name=?]', "settlement[back_push_money]")
      with_tag('input#settlement_total_push_money[name=?]', "settlement[total_push_money]")
      with_tag('input#settlement_total_subsidy[name=?]', "settlement[total_subsidy]")
      with_tag('input#settlement_total_deduction[name=?]', "settlement[total_deduction]")
      with_tag('input#settlement_act_push_money[name=?]', "settlement[act_push_money]")
    end
  end
end
