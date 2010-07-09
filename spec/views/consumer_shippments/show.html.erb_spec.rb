require 'spec_helper'

describe "/consumer_shippments/show.html.erb" do
  include ConsumerShippmentsHelper
  before(:each) do
    assigns[:consumer_shippment] = @consumer_shippment = stub_model(ConsumerShippment)
  end

  it "renders attributes in <p>" do
    render
  end
end
