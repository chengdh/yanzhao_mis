require 'spec_helper'

describe Power do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :system_function_id => 1,
      :is_select => false
    }
  end

  it "should create a new instance given valid attributes" do
    Power.create!(@valid_attributes)
  end
end
