require 'spec_helper'

describe "/tk_infos/new.html.erb" do
  include TkInfosHelper

  before(:each) do
    assigns[:tk_info] = stub_model(TkInfo,
      :new_record? => true
    )
  end

  it "renders new tk_info form" do
    render

    response.should have_tag("form[action=?][method=post]", tk_infos_path) do
    end
  end
end
