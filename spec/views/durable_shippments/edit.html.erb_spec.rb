require 'spec_helper'

describe "/durable_shippments/edit.html.erb" do
  include DurableShippmentsHelper

  before(:each) do
    assigns[:durable_shippment] = @durable_shippment = stub_model(DurableShippment,
      :new_record? => false
    )
  end

  it "renders the edit durable_shippment form" do
    render

    response.should have_tag("form[action=#{durable_shippment_path(@durable_shippment)}][method=post]") do
    end
  end
end
