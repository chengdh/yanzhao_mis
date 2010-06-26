require 'spec_helper'

describe "/departments/show.html.erb" do
  include DepartmentsHelper
  before(:each) do
    assigns[:department] = @department = stub_model(Department)
  end

  it "renders attributes in <p>" do
    render
  end
end
