require 'spec_helper'

describe "/inout_bills/new.html.erb" do
  include InoutBillsHelper

  before(:each) do
    assigns[:inout_bill] = stub_model(InoutBill,
      :new_record? => true
    )
  end

  it "renders new inout_bill form" do
    render

    response.should have_tag("form[action=?][method=post]", inout_bills_path) do
    end
  end
end
