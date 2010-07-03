require 'spec_helper'

describe Material do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :is_active => false,
      :description => "value for description",
      :type => "value for type",
      :min_count => 1,
      :unit => "value for unit"
    }
  end

  it "should create a new instance given valid attributes" do
    Material.create!(@valid_attributes)
  end
end
