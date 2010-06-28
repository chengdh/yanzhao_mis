require 'spec_helper'

describe "/notices/index.html.erb" do
  include NoticesHelper

  before(:each) do
    assigns[:notices] = [
      stub_model(Notice),
      stub_model(Notice)
    ]
  end

  it "renders a list of notices" do
    render
  end
end
