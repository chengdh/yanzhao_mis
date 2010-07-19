require 'spec_helper'

describe "/post_infos/edit.html.erb" do
  include PostInfosHelper

  before(:each) do
    assigns[:post_info] = @post_info = stub_model(PostInfo,
      :new_record? => false
    )
  end

  it "renders the edit post_info form" do
    render

    response.should have_tag("form[action=#{post_info_path(@post_info)}][method=post]") do
    end
  end
end
