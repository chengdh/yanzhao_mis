require 'spec_helper'

describe "/config_infos/index.html.erb" do
  include ConfigInfosHelper

  before(:each) do
    assigns[:config_infos] = [
      stub_model(ConfigInfo),
      stub_model(ConfigInfo)
    ]
  end

  it "renders a list of config_infos" do
    render
  end
end
