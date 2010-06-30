require 'spec_helper'

describe Comment do
  before(:each) do
    @valid_attributes = {
      :post_id => 1,
      :body => "value for body",
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Comment.create!(@valid_attributes)
  end
end
