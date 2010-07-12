require 'spec_helper'

describe "/clients/new.html.erb" do
  include ClientsHelper

  before(:each) do
    assigns[:client] = stub_model(Client,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new client form" do
    render

    response.should have_tag("form[action=?][method=post]", clients_path) do
      with_tag("input#client_name[name=?]", "client[name]")
    end
  end
end
