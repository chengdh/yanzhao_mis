require 'spec_helper'

describe "/durable_receipts/edit.html.erb" do
  include DurableReceiptsHelper

  before(:each) do
    assigns[:durable_receipt] = @durable_receipt = stub_model(DurableReceipt,
      :new_record? => false
    )
  end

  it "renders the edit durable_receipt form" do
    render

    response.should have_tag("form[action=#{durable_receipt_path(@durable_receipt)}][method=post]") do
    end
  end
end
