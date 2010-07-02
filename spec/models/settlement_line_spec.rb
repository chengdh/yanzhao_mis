require 'spec_helper'

describe SettlementLine do
  before(:each) do
    @valid_attributes = {
      :settlement_id => 1,
      :type => "value for type",
      :name => "value for name",
      :value => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    SettlementLine.create!(@valid_attributes)
  end
end
