require 'spec_helper'

describe VipFeeInfo do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :phone => "value for phone",
      :phone => "value for phone",
      :mth => "value for mth",
      :fee => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    VipFeeInfo.create!(@valid_attributes)
  end
end
