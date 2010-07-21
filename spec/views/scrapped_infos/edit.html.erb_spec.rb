require 'spec_helper'

describe "/scrapped_infos/edit.html.erb" do
  include ScrappedInfosHelper

  before(:each) do
    assigns[:scrapped_info] = @scrapped_info = stub_model(ScrappedInfo,
      :new_record? => false
    )
  end

  it "renders the edit scrapped_info form" do
    render

    response.should have_tag("form[action=#{scrapped_info_path(@scrapped_info)}][method=post]") do
    end
  end
end
