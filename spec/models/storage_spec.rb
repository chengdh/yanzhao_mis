require 'spec_helper'

describe Storage do
  before(:each) do
    @valid_attributes = {
      :warehouse_id => 1,
      :material_id => 1,
      :avg_price => 9.99,
      :qty => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Storage.create!(@valid_attributes)
  end
end
