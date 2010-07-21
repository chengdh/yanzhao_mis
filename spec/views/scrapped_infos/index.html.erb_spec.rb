require 'spec_helper'

describe "/scrapped_infos/index.html.erb" do
  include ScrappedInfosHelper

  before(:each) do
    assigns[:scrapped_infos] = [
      stub_model(ScrappedInfo),
      stub_model(ScrappedInfo)
    ]
  end

  it "renders a list of scrapped_infos" do
    render
  end
end
