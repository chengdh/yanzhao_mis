require 'spec_helper'

describe "/notices/show.html.erb" do
  include NoticesHelper
  before(:each) do
    assigns[:notice] = @notice = stub_model(Notice)
  end

  it "renders attributes in <p>" do
    render
  end
end
