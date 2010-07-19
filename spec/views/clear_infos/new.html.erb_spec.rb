require 'spec_helper'

describe "/clear_infos/new.html.erb" do
  include ClearInfosHelper

  before(:each) do
    assigns[:clear_info] = stub_model(ClearInfo,
      :new_record? => true
    )
  end

  it "renders new clear_info form" do
    render

    response.should have_tag("form[action=?][method=post]", clear_infos_path) do
    end
  end
end
