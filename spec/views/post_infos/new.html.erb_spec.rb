require 'spec_helper'

describe "/post_infos/new.html.erb" do
  include PostInfosHelper

  before(:each) do
    assigns[:post_info] = stub_model(PostInfo,
      :new_record? => true
    )
  end

  it "renders new post_info form" do
    render

    response.should have_tag("form[action=?][method=post]", post_infos_path) do
    end
  end
end
