require 'spec_helper'

describe "/config_infos/edit.html.erb" do
  include ConfigInfosHelper

  before(:each) do
    assigns[:config_info] = @config_info = stub_model(ConfigInfo,
      :new_record? => false
    )
  end

  it "renders the edit config_info form" do
    render

    response.should have_tag("form[action=#{config_info_path(@config_info)}][method=post]") do
    end
  end
end
