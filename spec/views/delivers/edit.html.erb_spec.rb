require 'spec_helper'

describe "/delivers/edit.html.erb" do
  include DeliversHelper

  before(:each) do
    assigns[:deliver] = @deliver = stub_model(Deliver,
      :new_record? => false
    )
  end

  it "renders the edit deliver form" do
    render

    response.should have_tag("form[action=#{deliver_path(@deliver)}][method=post]") do
    end
  end
end
