require 'spec_helper'

describe Settlement do
  before(:each) do
    @valid_attributes = {
      :org_id => 1,
      :user_id => 1,
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
    }
  end

  it "should create a new instance given valid attributes" do
    Settlement.create!(@valid_attributes)
  end
end
