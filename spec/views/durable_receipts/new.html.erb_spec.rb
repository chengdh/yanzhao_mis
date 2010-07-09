require 'spec_helper'

describe "/durable_receipts/new.html.erb" do
  include DurableReceiptsHelper

  before(:each) do
    assigns[:durable_receipt] = stub_model(DurableReceipt,
      :new_record? => true
    )
  end

  it "renders new durable_receipt form" do
    render

    response.should have_tag("form[action=?][method=post]", durable_receipts_path) do
    end
  end
end
