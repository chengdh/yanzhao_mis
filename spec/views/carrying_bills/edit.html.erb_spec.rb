require 'spec_helper'

describe "/carrying_bills/edit.html.erb" do
  include CarryingBillsHelper

  before(:each) do
    assigns[:carrying_bill] = @carrying_bill = stub_model(CarryingBill,
      :new_record? => false
    )
  end

  it "renders the edit carrying_bill form" do
    render

    response.should have_tag("form[action=#{carrying_bill_path(@carrying_bill)}][method=post]") do
    end
  end
end
