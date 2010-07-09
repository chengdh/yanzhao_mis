require 'spec_helper'

describe "/durable_shippments/new.html.erb" do
  include DurableShippmentsHelper

  before(:each) do
    assigns[:durable_shippment] = stub_model(DurableShippment,
      :new_record? => true
    )
  end

  it "renders new durable_shippment form" do
    render

    response.should have_tag("form[action=?][method=post]", durable_shippments_path) do
    end
  end
end
