require 'spec_helper'

describe "/consumer_shippments/new.html.erb" do
  include ConsumerShippmentsHelper

  before(:each) do
    assigns[:consumer_shippment] = stub_model(ConsumerShippment,
      :new_record? => true
    )
  end

  it "renders new consumer_shippment form" do
    render

    response.should have_tag("form[action=?][method=post]", consumer_shippments_path) do
    end
  end
end
