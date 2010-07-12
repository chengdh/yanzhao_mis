require 'spec_helper'

describe "/clients/show.html.erb" do
  include ClientsHelper
  before(:each) do
    assigns[:client] = @client = stub_model(Client,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end
