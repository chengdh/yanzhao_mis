require 'spec_helper'

describe "/carrying_bills/index.html.erb" do
  include CarryingBillsHelper

  before(:each) do
    assigns[:carrying_bills] = [
      stub_model(CarryingBill),
      stub_model(CarryingBill)
    ]
  end

  it "renders a list of carrying_bills" do
    render
  end
end
