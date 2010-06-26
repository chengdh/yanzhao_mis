require 'spec_helper'

describe "/sub_companies/new.html.erb" do
  include SubCompaniesHelper

  before(:each) do
    assigns[:sub_company] = stub_model(SubCompany,
      :new_record? => true
    )
  end

  it "renders new sub_company form" do
    render

    response.should have_tag("form[action=?][method=post]", sub_companies_path) do
    end
  end
end
