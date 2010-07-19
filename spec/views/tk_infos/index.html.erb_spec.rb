require 'spec_helper'

describe "/tk_infos/index.html.erb" do
  include TkInfosHelper

  before(:each) do
    assigns[:tk_infos] = [
      stub_model(TkInfo),
      stub_model(TkInfo)
    ]
  end

  it "renders a list of tk_infos" do
    render
  end
end
