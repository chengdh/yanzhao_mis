require 'spec_helper'

describe "/consumer_shippments/edit.html.erb" do
  include ConsumerShippmentsHelper

  before(:each) do
    assigns[:consumer_shippment] = @consumer_shippment = stub_model(ConsumerShippment,
      :new_record? => false
    )
  end

  it "renders the edit consumer_shippment form" do
    render

    response.should have_tag("form[action=#{consumer_shippment_path(@consumer_shippment)}][method=post]") do
    end
  end
end
