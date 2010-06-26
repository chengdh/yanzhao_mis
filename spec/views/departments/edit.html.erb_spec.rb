require 'spec_helper'

describe "/departments/edit.html.erb" do
  include DepartmentsHelper

  before(:each) do
    assigns[:department] = @department = stub_model(Department,
      :new_record? => false
    )
  end

  it "renders the edit department form" do
    render

    response.should have_tag("form[action=#{department_path(@department)}][method=post]") do
    end
  end
end
