require 'spec_helper'

describe ContractItem do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :is_active => false,
      :type => "value for type",
      :value => 9.99,
      :contract_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    ContractItem.create!(@valid_attributes)
  end
end
