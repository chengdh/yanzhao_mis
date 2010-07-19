require 'spec_helper'

describe "/carrying_bills/new.html.erb" do
  include CarryingBillsHelper

  before(:each) do
    assigns[:carrying_bill] = stub_model(CarryingBill,
      :new_record? => true
    )
  end

  it "renders new carrying_bill form" do
    render

    response.should have_tag("form[action=?][method=post]", carrying_bills_path) do
    end
  end
end
