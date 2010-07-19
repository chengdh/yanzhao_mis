require 'spec_helper'

describe "/config_infos/show.html.erb" do
  include ConfigInfosHelper
  before(:each) do
    assigns[:config_info] = @config_info = stub_model(ConfigInfo)
  end

  it "renders attributes in <p>" do
    render
  end
end
