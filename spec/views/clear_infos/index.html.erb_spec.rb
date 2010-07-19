require 'spec_helper'

describe "/clear_infos/index.html.erb" do
  include ClearInfosHelper

  before(:each) do
    assigns[:clear_infos] = [
      stub_model(ClearInfo),
      stub_model(ClearInfo)
    ]
  end

  it "renders a list of clear_infos" do
    render
  end
end
