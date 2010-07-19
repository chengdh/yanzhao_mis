require 'spec_helper'

describe "/confirms/new.html.erb" do
  include ConfirmsHelper

  before(:each) do
    assigns[:confirm] = stub_model(Confirm,
      :new_record? => true
    )
  end

  it "renders new confirm form" do
    render

    response.should have_tag("form[action=?][method=post]", confirms_path) do
    end
  end
end
