require 'spec_helper'

describe "/tk_infos/edit.html.erb" do
  include TkInfosHelper

  before(:each) do
    assigns[:tk_info] = @tk_info = stub_model(TkInfo,
      :new_record? => false
    )
  end

  it "renders the edit tk_info form" do
    render

    response.should have_tag("form[action=#{tk_info_path(@tk_info)}][method=post]") do
    end
  end
end
