require 'spec_helper'

describe "/carrying_bills/show.html.erb" do
  include CarryingBillsHelper
  before(:each) do
    assigns[:carrying_bill] = @carrying_bill = stub_model(CarryingBill)
  end

  it "renders attributes in <p>" do
    render
  end
end
