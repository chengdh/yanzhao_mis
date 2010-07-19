require 'spec_helper'

describe "/confirms/index.html.erb" do
  include ConfirmsHelper

  before(:each) do
    assigns[:confirms] = [
      stub_model(Confirm),
      stub_model(Confirm)
    ]
  end

  it "renders a list of confirms" do
    render
  end
end
