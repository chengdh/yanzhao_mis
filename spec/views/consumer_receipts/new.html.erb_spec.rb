require 'spec_helper'

describe "/consumer_receipts/new.html.erb" do
  include ConsumerReceiptsHelper

  before(:each) do
    assigns[:consumer_receipt] = stub_model(ConsumerReceipt,
      :new_record? => true
    )
  end

  it "renders new consumer_receipt form" do
    render

    response.should have_tag("form[action=?][method=post]", consumer_receipts_path) do
    end
  end
end
