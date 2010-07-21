require 'spec_helper'

describe "/scrapped_infos/show.html.erb" do
  include ScrappedInfosHelper
  before(:each) do
    assigns[:scrapped_info] = @scrapped_info = stub_model(ScrappedInfo)
  end

  it "renders attributes in <p>" do
    render
  end
end
