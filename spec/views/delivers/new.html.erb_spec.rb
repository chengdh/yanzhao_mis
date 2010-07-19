require 'spec_helper'

describe "/delivers/new.html.erb" do
  include DeliversHelper

  before(:each) do
    assigns[:deliver] = stub_model(Deliver,
      :new_record? => true
    )
  end

  it "renders new deliver form" do
    render

    response.should have_tag("form[action=?][method=post]", delivers_path) do
    end
  end
end
