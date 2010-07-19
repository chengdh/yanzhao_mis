require 'spec_helper'

describe "/post_infos/show.html.erb" do
  include PostInfosHelper
  before(:each) do
    assigns[:post_info] = @post_info = stub_model(PostInfo)
  end

  it "renders attributes in <p>" do
    render
  end
end
