require 'spec_helper'

describe "/clients/index.html.erb" do
  include ClientsHelper

  before(:each) do
    assigns[:clients] = [
      stub_model(Client,
        :name => "value for name"
      ),
      stub_model(Client,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of clients" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end
