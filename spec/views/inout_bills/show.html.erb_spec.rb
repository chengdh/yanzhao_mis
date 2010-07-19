require 'spec_helper'

describe "/inout_bills/show.html.erb" do
  include InoutBillsHelper
  before(:each) do
    assigns[:inout_bill] = @inout_bill = stub_model(InoutBill)
  end

  it "renders attributes in <p>" do
    render
  end
end
