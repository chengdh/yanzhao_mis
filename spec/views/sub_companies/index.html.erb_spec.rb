require 'spec_helper'

describe "/sub_companies/index.html.erb" do
  include SubCompaniesHelper

  before(:each) do
    assigns[:sub_companies] = [
      stub_model(SubCompany),
      stub_model(SubCompany)
    ]
  end

  it "renders a list of sub_companies" do
    render
  end
end
