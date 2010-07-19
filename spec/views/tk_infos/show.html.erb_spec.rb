require 'spec_helper'

describe "/tk_infos/show.html.erb" do
  include TkInfosHelper
  before(:each) do
    assigns[:tk_info] = @tk_info = stub_model(TkInfo)
  end

  it "renders attributes in <p>" do
    render
  end
end
