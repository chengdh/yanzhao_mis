require 'spec_helper'

describe "/scrapped_infos/new.html.erb" do
  include ScrappedInfosHelper

  before(:each) do
    assigns[:scrapped_info] = stub_model(ScrappedInfo,
      :new_record? => true
    )
  end

  it "renders new scrapped_info form" do
    render

    response.should have_tag("form[action=?][method=post]", scrapped_infos_path) do
    end
  end
end
