require 'spec_helper'

describe VipConfig do
  before(:each) do
    @valid_attributes = {
      :org_id => 1,
      :name => "value for name",
      :fee_from => 9.99,
      :fee_to => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    VipConfig.create!(@valid_attributes)
  end
end
