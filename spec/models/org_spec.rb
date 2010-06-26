require 'spec_helper'

describe Org do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :user_id => 1,
      :is_active => false,
      :address => "value for address",
      :phone => "value for phone"
    }
  end

  it "should create a new instance given valid attributes" do
    Org.create!(@valid_attributes)
  end
end
