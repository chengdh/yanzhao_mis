require 'spec_helper'

describe "/durable_receipts/index.html.erb" do
  include DurableReceiptsHelper

  before(:each) do
    assigns[:durable_receipts] = [
      stub_model(DurableReceipt),
      stub_model(DurableReceipt)
    ]
  end

  it "renders a list of durable_receipts" do
    render
  end
end
