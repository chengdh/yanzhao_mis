require 'spec_helper'

describe "/inout_bills/index.html.erb" do
  include InoutBillsHelper

  before(:each) do
    assigns[:inout_bills] = [
      stub_model(InoutBill),
      stub_model(InoutBill)
    ]
  end

  it "renders a list of inout_bills" do
    render
  end
end
