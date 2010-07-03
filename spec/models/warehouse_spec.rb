require 'spec_helper'

describe Warehouse do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :is_active => false,
      :note => "value for note",
      :manager => "value for manager"
    }
  end

  it "should create a new instance given valid attributes" do
    Warehouse.create!(@valid_attributes)
  end
end
