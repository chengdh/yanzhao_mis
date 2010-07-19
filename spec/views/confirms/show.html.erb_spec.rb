require 'spec_helper'

describe "/confirms/show.html.erb" do
  include ConfirmsHelper
  before(:each) do
    assigns[:confirm] = @confirm = stub_model(Confirm)
  end

  it "renders attributes in <p>" do
    render
  end
end
