require 'spec_helper'

describe "/clients/edit.html.erb" do
  include ClientsHelper

  before(:each) do
    assigns[:client] = @client = stub_model(Client,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit client form" do
    render

    response.should have_tag("form[action=#{client_path(@client)}][method=post]") do
      with_tag('input#client_name[name=?]', "client[name]")
    end
  end
end
