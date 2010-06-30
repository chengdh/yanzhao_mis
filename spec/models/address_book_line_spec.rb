require 'spec_helper'

describe AddressBookLine do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :phone => "value for phone",
      :mobile => "value for mobile",
      :is_active => false,
      :address_book_id => 1,
      :location => "value for location",
      :note => "value for note"
    }
  end

  it "should create a new instance given valid attributes" do
    AddressBookLine.create!(@valid_attributes)
  end
end
