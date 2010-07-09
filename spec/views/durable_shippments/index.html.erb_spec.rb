require 'spec_helper'

describe "/durable_shippments/index.html.erb" do
  include DurableShippmentsHelper

  before(:each) do
    assigns[:durable_shippments] = [
      stub_model(DurableShippment),
      stub_model(DurableShippment)
    ]
  end

  it "renders a list of durable_shippments" do
    render
  end
end
