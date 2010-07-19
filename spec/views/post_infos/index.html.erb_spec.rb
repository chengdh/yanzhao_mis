require 'spec_helper'

describe "/post_infos/index.html.erb" do
  include PostInfosHelper

  before(:each) do
    assigns[:post_infos] = [
      stub_model(PostInfo),
      stub_model(PostInfo)
    ]
  end

  it "renders a list of post_infos" do
    render
  end
end
