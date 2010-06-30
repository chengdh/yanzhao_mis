require 'spec_helper'

describe AddressBook do
  before(:each) do
    @valid_attributes = {
      :org_id => 1,
      :user_id => 1,
      :is_active => false
    }
  end

  it "should create a new instance given valid attributes" do
    AddressBook.create!(@valid_attributes)
  end
end
