require 'spec_helper'

describe SystemFunction do
  before(:each) do
    @valid_attributes = {
      :group => "value for group",
      :func_name => "value for func_name",
      :func_key => "value for func_key",
      :is_active => false
    }
  end

  it "should create a new instance given valid attributes" do
    SystemFunction.create!(@valid_attributes)
  end
end
