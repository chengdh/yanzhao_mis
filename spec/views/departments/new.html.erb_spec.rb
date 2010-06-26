require 'spec_helper'

describe "/departments/new.html.erb" do
  include DepartmentsHelper

  before(:each) do
    assigns[:department] = stub_model(Department,
      :new_record? => true
    )
  end

  it "renders new department form" do
    render

    response.should have_tag("form[action=?][method=post]", departments_path) do
    end
  end
end
