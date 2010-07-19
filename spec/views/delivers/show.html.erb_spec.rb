require 'spec_helper'

describe "/delivers/show.html.erb" do
  include DeliversHelper
  before(:each) do
    assigns[:deliver] = @deliver = stub_model(Deliver)
  end

  it "renders attributes in <p>" do
    render
  end
end
