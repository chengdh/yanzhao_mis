require 'spec_helper'

describe "/consumer_receipts/index.html.erb" do
  include ConsumerReceiptsHelper

  before(:each) do
    assigns[:consumer_receipts] = [
      stub_model(ConsumerReceipt),
      stub_model(ConsumerReceipt)
    ]
  end

  it "renders a list of consumer_receipts" do
    render
  end
end
