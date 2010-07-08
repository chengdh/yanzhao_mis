require 'spec_helper'

describe ContractRadio do
  before(:each) do
    @valid_attributes = {
      :contract_id => 1,
      :mth => "value for mth",
      :start_radio => 9.99,
      :back_radio => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    ContractRadio.create!(@valid_attributes)
  end
end
