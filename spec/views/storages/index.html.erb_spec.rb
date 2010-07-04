require 'spec_helper'

describe "/storages/index.html.erb" do
  include StoragesHelper

  before(:each) do
    assigns[:storages] = [
      stub_model(Storage,
        :warehouse => 1,
        :material => 1,
        :avg_price => 9.99,
        :qty => 1
      ),
      stub_model(Storage,
        :warehouse => 1,
        :material => 1,
        :avg_price => 9.99,
        :qty => 1
      )
    ]
  end

  it "renders a list of storages" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
