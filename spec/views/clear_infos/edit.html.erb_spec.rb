require 'spec_helper'

describe "/clear_infos/edit.html.erb" do
  include ClearInfosHelper

  before(:each) do
    assigns[:clear_info] = @clear_info = stub_model(ClearInfo,
      :new_record? => false
    )
  end

  it "renders the edit clear_info form" do
    render

    response.should have_tag("form[action=#{clear_info_path(@clear_info)}][method=post]") do
    end
  end
end
