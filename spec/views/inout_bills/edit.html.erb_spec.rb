require 'spec_helper'

describe "/inout_bills/edit.html.erb" do
  include InoutBillsHelper

  before(:each) do
    assigns[:inout_bill] = @inout_bill = stub_model(InoutBill,
      :new_record? => false
    )
  end

  it "renders the edit inout_bill form" do
    render

    response.should have_tag("form[action=#{inout_bill_path(@inout_bill)}][method=post]") do
    end
  end
end
