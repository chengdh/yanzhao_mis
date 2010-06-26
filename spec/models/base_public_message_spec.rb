require 'spec_helper'

describe BasePublicMessage do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :body => "value for body",
      :type => "value for type",
      :is_secure => false,
      :state => "value for state",
      :org_id => 1,
      :is_active => false,
      :user_id => 1,
      :publish_date => Time.now,
      :publisher_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    BasePublicMessage.create!(@valid_attributes)
  end
end
