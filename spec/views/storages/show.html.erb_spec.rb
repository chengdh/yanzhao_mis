require 'spec_helper'

describe "/storages/show.html.erb" do
  include StoragesHelper
  before(:each) do
    assigns[:storage] = @storage = stub_model(Storage,
      :warehouse => 1,
      :material => 1,
      :avg_price => 9.99,
      :qty => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
    response.should have_text(/1/)
  end
end
