require 'spec_helper'

describe "/confirms/edit.html.erb" do
  include ConfirmsHelper

  before(:each) do
    assigns[:confirm] = @confirm = stub_model(Confirm,
      :new_record? => false
    )
  end

  it "renders the edit confirm form" do
    render

    response.should have_tag("form[action=#{confirm_path(@confirm)}][method=post]") do
    end
  end
end
