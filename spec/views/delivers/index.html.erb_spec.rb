require 'spec_helper'

describe "/delivers/index.html.erb" do
  include DeliversHelper

  before(:each) do
    assigns[:delivers] = [
      stub_model(Deliver),
      stub_model(Deliver)
    ]
  end

  it "renders a list of delivers" do
    render
  end
end
