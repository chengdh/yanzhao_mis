require 'spec_helper'

describe "/notices/edit.html.erb" do
  include NoticesHelper

  before(:each) do
    assigns[:notice] = @notice = stub_model(Notice,
      :new_record? => false
    )
  end

  it "renders the edit notice form" do
    render

    response.should have_tag("form[action=#{notice_path(@notice)}][method=post]") do
    end
  end
end
