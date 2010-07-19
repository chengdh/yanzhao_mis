require 'spec_helper'

describe "/clear_infos/show.html.erb" do
  include ClearInfosHelper
  before(:each) do
    assigns[:clear_info] = @clear_info = stub_model(ClearInfo)
  end

  it "renders attributes in <p>" do
    render
  end
end
