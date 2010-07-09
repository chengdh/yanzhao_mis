require 'spec_helper'

describe "/consumer_shippments/index.html.erb" do
  include ConsumerShippmentsHelper

  before(:each) do
    assigns[:consumer_shippments] = [
      stub_model(ConsumerShippment),
      stub_model(ConsumerShippment)
    ]
  end

  it "renders a list of consumer_shippments" do
    render
  end
end
