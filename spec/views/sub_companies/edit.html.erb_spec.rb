require 'spec_helper'

describe "/sub_companies/edit.html.erb" do
  include SubCompaniesHelper

  before(:each) do
    assigns[:sub_company] = @sub_company = stub_model(SubCompany,
      :new_record? => false
    )
  end

  it "renders the edit sub_company form" do
    render

    response.should have_tag("form[action=#{sub_company_path(@sub_company)}][method=post]") do
    end
  end
end
