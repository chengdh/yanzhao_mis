require 'spec_helper'

describe "/durable_shippments/show.html.erb" do
  include DurableShippmentsHelper
  before(:each) do
    assigns[:durable_shippment] = @durable_shippment = stub_model(DurableShippment)
  end

  it "renders attributes in <p>" do
    render
  end
end
