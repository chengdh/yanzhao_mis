require 'spec_helper'

describe "/durable_receipts/show.html.erb" do
  include DurableReceiptsHelper
  before(:each) do
    assigns[:durable_receipt] = @durable_receipt = stub_model(DurableReceipt)
  end

  it "renders attributes in <p>" do
    render
  end
end
