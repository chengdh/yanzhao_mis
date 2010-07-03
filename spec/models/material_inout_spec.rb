require 'spec_helper'

describe MaterialInout do
  before(:each) do
    @valid_attributes = {
      :inout_date => Date.today,
      :org_id => 1,
      :warehouse_id => 1,
      :person_name => "value for person_name",
      :note => "value for note"
    }
  end

  it "should create a new instance given valid attributes" do
    MaterialInout.create!(@valid_attributes)
  end
end
