require 'spec_helper'

describe "/consumer_receipts/show.html.erb" do
  include ConsumerReceiptsHelper
  before(:each) do
    assigns[:consumer_receipt] = @consumer_receipt = stub_model(ConsumerReceipt)
  end

  it "renders attributes in <p>" do
    render
  end
end
