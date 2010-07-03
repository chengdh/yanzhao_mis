require 'spec_helper'

describe MaterialInoutLine do
  before(:each) do
    @valid_attributes = {
      :material_inout_id => 1,
      :material_id => 1,
      :type => "value for type",
      :qty => 1,
      :price => 9.99,
      :line_amt => 
    }
  end

  it "should create a new instance given valid attributes" do
    MaterialInoutLine.create!(@valid_attributes)
  end
end
