require 'spec_helper'

describe Contract do
  before(:each) do
    @valid_attributes = {
      :org_id => 1,
      :date_from => Date.today,
      :date_to => Date.today,
      :radio_start => 9.99,
      :radio_back => 9.99,
      :note => "value for note"
    }
  end

  it "should create a new instance given valid attributes" do
    Contract.create!(@valid_attributes)
  end
end
