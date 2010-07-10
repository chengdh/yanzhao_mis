require 'spec_helper'

describe VipInfo do
  before(:each) do
    @valid_attributes = {
      :org_id => 1,
      :name => "value for name",
      :phone => "value for phone",
      :cur_fee => 9.99,
      :level => "value for level",
      :state => "value for state"
    }
  end

  it "should create a new instance given valid attributes" do
    VipInfo.create!(@valid_attributes)
  end
end
