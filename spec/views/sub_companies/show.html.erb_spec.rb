require 'spec_helper'

describe "/sub_companies/show.html.erb" do
  include SubCompaniesHelper
  before(:each) do
    assigns[:sub_company] = @sub_company = stub_model(SubCompany)
  end

  it "renders attributes in <p>" do
    render
  end
end
