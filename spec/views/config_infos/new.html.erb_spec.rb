require 'spec_helper'

describe "/config_infos/new.html.erb" do
  include ConfigInfosHelper

  before(:each) do
    assigns[:config_info] = stub_model(ConfigInfo,
      :new_record? => true
    )
  end

  it "renders new config_info form" do
    render

    response.should have_tag("form[action=?][method=post]", config_infos_path) do
    end
  end
end
