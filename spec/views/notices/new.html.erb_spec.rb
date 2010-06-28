require 'spec_helper'

describe "/notices/new.html.erb" do
  include NoticesHelper

  before(:each) do
    assigns[:notice] = stub_model(Notice,
      :new_record? => true
    )
  end

  it "renders new notice form" do
    render

    response.should have_tag("form[action=?][method=post]", notices_path) do
    end
  end
end
