require 'spec_helper'

describe "/consumer_receipts/edit.html.erb" do
  include ConsumerReceiptsHelper

  before(:each) do
    assigns[:consumer_receipt] = @consumer_receipt = stub_model(ConsumerReceipt,
      :new_record? => false
    )
  end

  it "renders the edit consumer_receipt form" do
    render

    response.should have_tag("form[action=#{consumer_receipt_path(@consumer_receipt)}][method=post]") do
    end
  end
end
